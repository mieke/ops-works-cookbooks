#default['tokudb']['url'] = 'http://www.tokutek.com/download.php?download_file=mysql-5.5.41-tokudb-7.5.5-linux-x86_64.tar.gz'
default['tokudb']['url'] = 'http://www.tokutek.com/tokudb-for-mysql/tokudb-community-edition-download/?file=mysql-5.5.41-tokudb-7.5.5-linux-x86_64.tar.gz'
default['tokudb']['install_dir'] = '/opt/tokutek/mysql'
default['tokudb']['data_dir'] = '/var/lib/mysql'
default['tokudb']['bin_log_path'] = '/var/lib/mysql/binlog/mysql-bin'
default['tokudb']['user'] = 'mysql'
default['tokudb']['group'] = 'mysql'
