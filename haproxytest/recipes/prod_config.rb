service "haproxy" do
  supports :restart => true, :status => true, :reload => true
  #action :nothing # only define so that it can be restarted if the config changed
  action [:enable, :start]
end

node.default['haproxy']['environment']='prod'
template "/etc/haproxy/haproxy.cfg" do
  cookbook "haproxytest"
  source "haproxy.cfg.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :reload, "service[haproxy]"
end

execute "echo 'checking if HAProxy is not running - if so start it'" do
  not_if "pgrep haproxy"
  notifies :start, "service[haproxy]"
end
