#apt_package resource is used to manage packages for the Debian and Ubuntu platforms.
apt_package "apt-get install mariadb-server" do
  version node[:mariadb_version]
  action :install
end
