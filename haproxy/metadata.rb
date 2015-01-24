maintainer        "One Cloud Systems, Inc."
maintainer_email  "mieke@onecloussys.com"
license           "Apache 2.0"
description       "Installs and configures haproxy"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "1.0.0"

recipe 'haproxy', 'Install and configure a HAProxy instance'
recipe "haproxy::app_lb", "Installs and configures haproxy by searching for nodes of a particular role"

attribute 'haproxy/backend',
  :display_name => 'Backend',
  :description => 'List of backend services to load balance',
  :required => true,
  :type => 'array

