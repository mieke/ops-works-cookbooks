
case node['platform_family']
when 'debian'

  default['mariadb']['data_dir'] = '/var/lib/mysql'

  default['mariadb']['server']['packages'] = %w(mariadb-server apparmor-utils)

end
