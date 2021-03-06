def registry_key_exists(hive, key)
  begin
    hive.open(key)
    return true
  rescue
    return false
  end
end

def registry_update(mode)
  require 'win32/registry'
  require 'ruby-wmi'

  path = @new_resource.key_name.split("\\")
  hive_name = path.shift

  #support standard abbreviations
  hkey = {
    "HKLM" => "HKEY_LOCAL_MACHINE",
    "HKCU" => "HKEY_CURRENT_USER",
    "HKU" => "HKEY_USERS"
  }[hive_name] || hive_name

  hive = {
    "HKEY_LOCAL_MACHINE" => Win32::Registry::HKEY_LOCAL_MACHINE,
    "HKEY_USERS" => Win32::Registry::HKEY_USERS,
    "HKEY_CURRENT_USER" => Win32::Registry::HKEY_CURRENT_USER
  }[hkey]

  unless hive
    Chef::Application.fatal!("Unsupported registry hive '#{hive_name}'")
  end

  if hive == Win32::Registry::HKEY_USERS && !registry_key_exists(hive, path[0])
    name = path[0]
    sid = nil

    begin
      sid = WMI::Win32_UserAccount.find(:first, :conditions => {:name => name}).sid
      if registry_key_exists(hive, sid)
        path[0] = sid #use the active profile (user is logged on)
        Chef::Log.debug("HKEY_USERS: #{name} -> #{sid}")
      else
        sid = nil
      end
    rescue
    end

    if sid == nil
      #use the backup profile on disk (user is not logged on)
      #XXX lookup user profile dir; this is the default
      file = "C:\\Documents and Settings\\#{name}\\NTUSER.DAT"
      if ::File.exists?(file)
        @priv = Chef::WindowsPrivileged.new
        if @priv.reg_load_key(name, file)
          Chef::Log.debug("RegLoadKey(#{hkey}, #{name}, #{file})")
        else
          @priv = nil
        end
      end
    end
  end

  key_name = path.join("\\")
  Chef::Log.debug("#{hkey}.#{mode}(#{key_name})")
  hive.send(mode, key_name, Win32::Registry::KEY_ALL_ACCESS) do |reg|
    @new_resource.values.each do |k,val|
      key = "#{k}" #wtf. avoid "can't modify frozen string" in win32/registry.rb
      cur_val = nil
      begin
        cur_val = reg[key]
      rescue
        #subkey does not exist (ok)
      end
      if cur_val != val
        Chef::Log.debug("#{@new_resource}: setting #{key}=#{val}")
        reg[key] = val
        @new_resource.updated = true
      end
    end
  end

  if @priv
    begin
      @priv.reg_unload_key(path[0])
    rescue
    end
  end
end

def action_create
  registry_update(:create)
end

def action_modify
  registry_update(:open)
end
