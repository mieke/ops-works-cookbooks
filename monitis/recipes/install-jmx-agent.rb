# Recipe specific to installing the Monitis JMS Agent

#if File.exists?("#{node[:MONITIS][:JMX][:INSTALLDIR]}/mon_jmx_agent.war")
  #self.msg("Monitis JMX Agent already installed")
#else

service 'tomcat' do
  supports :restart => true, :status => true, :reload => true
  action :nothing
end

#Use the remote_file resource to transfer a file from a remote location using file specificity.
remote_file "Download mon_jmx_agent.war" do
  source "#{node['MONITIS']['JMX']['WAR']}"
  path "#{node['MONITIS']['JMX']['INSTALLDIR']}"
  backup false
  # notifies :restart, resources(:service => 'tomcat'), :immediately
end
