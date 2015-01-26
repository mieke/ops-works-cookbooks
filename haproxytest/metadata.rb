name             "haproxytest"
description      "Installs and configures haproxy"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
maintainer       "OneCloud Systems"
license          "Apache 2.0"
version          "1.0.0"

recipe "haproxytest","Install and configure a HAProxy instance"
recipe "haproxytest::runme", "reconfigure and restart HAProxy"
