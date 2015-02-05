#----
# Install software
#----
include_recipe "apt"

apt_package "mariadb-server-5.5" do
  action :install
end
