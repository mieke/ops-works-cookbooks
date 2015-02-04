#----
# Install software
#----
node['mariadb']['server']['packages'].each do |name|
  package name do
    action :install
  end
end

node['mariadb']['server']['directories'].each do |_key, value|
  directory value do
    owner     'mysql'
    group     'mysql'
    mode      '0775'
    action    :create
    recursive true
  end
end
