#----
# Install software
#----
#include_recipe "apt"

#apt_package "mariadb-server-5.5" do
  #action :install
#end

package 'mariadb-server' do
  
  # 'install' is the package resource's default action so it could skipped
  action :install
end
