#default['tokudb']['url'] = 'http://www.tokutek.com/download.php?download_file=mysql-5.5.41-tokudb-7.5.5-linux-x86_64.tar.gz'
#default['tokudb']['url'] = 'http://www.tokutek.com/tokudb-for-mysql/tokudb-community-edition-download/?file=mysql-5.5.41-tokudb-7.5.5-linux-x86_64.tar.gz'
default['tokudb']['url'] = 'https://s3-us-west-2.amazonaws.com/mieke-tars/mysql-5.5.41-tokudb-7.5.5-linux-x86_64.tar.gz'
default['tokudb']['install_dir'] = '/opt/tokutek/mysql'
default['tokudb']['data_dir'] = '/mysqldata/datafiles'
default['tokudb']['bin_log_path'] = '/var/lib/mysql/binlog/mysql-bin'
default['tokudb']['user'] = 'mysql'
default['tokudb']['group'] = 'mysql'

default['tokudb']['slow-query-log'] = '1'
default['tokudb']['slow-query-log-file'] = '/mnt/var/log/mysql/log-slow-queries.log'
default['tokudb']['long_query_time'] = '2'
default['tokudb']['max_connections'] = '10000'
default['tokudb']['max_connect_errors'] = '10000'

default['tokudb']['open-files-limit'] = '50005'
default['tokudb']['table-open-cache'] = '5000'
default['tokudb']['character-set-client-handshake'] = 'false'
default['tokudb']['character_set_filesystem'] = 'utf8'
default['tokudb']['character_set_server'] = 'utf8'

default['tokudb']['query_cache_limit'] = '1M'
default['tokudb']['query_cache_size'] = '0'

default['tokudb']['log_error'] = '/mnt/var/log/mysql/error.log'
default['tokudb']['server-id'] = '53'
default['tokudb']['log_bin'] = '/mnt/var/log/mysql/mysql-bin.log'
default['tokudb']['binlog_format'] = 'ROW'
default['tokudb']['expire_logs_days'] = '4'
default['tokudb']['max_binlog_size'] = '1G'
default['tokudb']['sync_binlog'] = '0'
#machine specific name get injected here
default['tokudb']['relay-log'] = 'node[:opsworks][:instance][:hostname]-relay-bin'

default['tokudb']['thread_pool_size'] = '500'
default['tokudb']['transaction_isolation'] = 'READ-COMMITTED'
default['tokudb']['event_scheduler'] = 'READ-OFF'
default['tokudb']['read_rnd_buffer_size'] = '32M'
default['tokudb']['max_heap_table_size'] = '128M'
default['tokudb']['tmp_table_size'] = '128M'


