#
# Cookbook Name:: monitis
# Attributes:: default
#
# Author:: 
#
# Copyright 2012, Monitis, Inc.


# default attributes for all platforms
default['MONITIS']['INSTALLDIR'] = "/usr/local"
default['MONITIS']['USEREMAIL'] = "mieke@onecloudsys.com"
default['MONITIS']['PASSWORD'] = "onecloud"
default['MONITIS']['AGENTNAME'] = node[:hostname]

default['MONITIS']['TARBALL_32'] = "MonitisLinuxAgent-32bit.tar.gz"
default['MONITIS']['TARBALL_64'] = "MonitisLinuxAgent-64bit.tar.gz"
default['MONITIS']['TARBALL_URL_32'] = "http://dashboard1.monitis.com/downloader?type=internalAgent&platform=linux32&version=v4_01_20"
default['MONITIS']['TARBALL_URL_64'] = "http://dashboard1.monitis.com/downloader?type=internalAgent&platform=linux64&version=v4_01_20"

# Monitis JMX Agent
default['MONITIS']['JMX'['WAR'] = "https://s3-us-west-2.amazonaws.com/mieke-wars/mon_jmx_agent.war"
default['MONITIS']['JMX'['INSTALLDIR'] = "/var/lib/tomcat7/webapps"

# overrides on a platform-by-platform basis
case platform
when "debian","ubuntu"

default['MONITIS']['LIBSSL'] = "openssl"

when "redhat","centos","fedora"
default['MONITIS']['LIBSSL'] = "openssl-devel"

when "suse"

default['MONITIS']['LIBSSL'] = "libopenssl1_0_0"

when "windows"

default['MONITIS']['TEMP'] = ENV['temp']
default['MONITIS']['TARBALL'] = "MonitisWindowsAgent-32-64bit.zip"
default['MONITIS']['TARBALL_URL'] = "http://dashboard1.monitis.com/downloader?type=internalAgent&platform=win32&version=v4_01_19"

end
