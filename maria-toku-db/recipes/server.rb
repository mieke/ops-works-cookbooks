#----
# Install software
#----
#include_recipe "apt"

apt_package "mariadb-server" do
  version 10.0
  action :install
end

#package 'mariadb-server' do
  
  # 'install' is the package resource's default action so it could skipped
  #action :install
#end
