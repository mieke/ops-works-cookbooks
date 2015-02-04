#----
# Install software
# apt_package resource is used to manage packages for the Debian and Ubuntu platforms.
#----

#node['mariadb']['server']['packages'].each do |name|
#  package name do
 #   action :install
#  end
#end

apt_package "mariadb-server-5.5" do
  action :install
end

