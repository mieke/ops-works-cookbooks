#apt_package resource is used to manage packages for the Debian and Ubuntu platforms.
apt_package "mariadb-tokudb-engine" do
  version node[:mariadb-tokudb-engine_version]
  action :install
end

