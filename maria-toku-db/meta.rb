name             "maria-toku-db"
description      "Installs MariaDB and TokuDB"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
license           'Apache 2.0'
maintainer       "OneCloud Systems"

recipe            'maria-toku-db::server', 'Installs packages required for mariadb servers w/o manual intervention'

# actually tested on
supports 'centos'
supports 'debian'
supports 'ubuntu'

depends 'apt',              '~> 2.0'
