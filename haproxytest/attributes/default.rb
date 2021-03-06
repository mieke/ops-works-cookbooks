##
# not use this file to override the haproxy cookbook's default
# attributes.  Instead, please use the customize.rb attributes file,
# which will keep your adjustments separate from the AWS OpsWorks
# codebase and make it easier to upgrade.
#
# However, you should not edit customize.rb directly. Instead, create
# "haproxy/attributes/customize.rb" in your cookbook repository and
# put the overrides in YOUR customize.rb file.
#
# Do NOT create an 'haproxy/attributes/default.rb' in your cookbooks. Doing so
# would completely override this file and might cause upgrade issues.
#
# See also: http://docs.aws.amazon.com/opsworks/latest/userguide/customizing.html
###

#include_attribute 'opsworks_commons::default'

rhel_arch = RUBY_PLATFORM.match(/64/) ? 'x86_64' : 'i686'
default[:haproxy][:version] = '1.4.22'
default[:haproxy][:patchlevel] = '1'
default[:haproxy][:rpm] = "haproxy-#{node[:haproxy][:version]}-#{node[:haproxy][:patchlevel]}.#{rhel_arch}.rpm"
default[:haproxy][:rpm_url] = "#{node[:opsworks_commons][:assets_url]}/packages/#{node[:platform]}/#{node[:platform_version]}/#{node[:haproxy][:rpm]}"

default[:haproxy][:stats_url] = '/haproxy?stats'
default[:haproxy][:stats_user] = 'opsworks'
default[:haproxy][:health_check_url] = '/'
default[:haproxy][:health_check_method] = 'OPTIONS'
default[:haproxy][:check_interval] = '10s'
default[:haproxy][:client_timeout] = '60s'
default[:haproxy][:server_timeout] = '60s'
default[:haproxy][:queue_timeout] = '120s'
default[:haproxy][:connect_timeout] = '10s'
default[:haproxy][:http_request_timeout] = '30s'
default[:haproxy][:global_max_connections] = '80000'
default[:haproxy][:default_max_connections] = '80000'
default[:haproxy][:retries] = '3'
default[:haproxy][:httpclose] = true
default[:haproxy][:http_server_close] = false
default[:haproxy][:stats_socket_path] = '/tmp/haproxy.sock'
default[:haproxy][:stats_socket_level] = nil # nil for default or 'user', 'operator', 'admin'

# load factors for maxcon
default[:haproxy][:maxcon_factor_rails_app] = 7
default[:haproxy][:maxcon_factor_rails_app_ssl] = 7
default[:haproxy][:maxcon_factor_php_app] = 10
default[:haproxy][:maxcon_factor_php_app_ssl] = 10
default[:haproxy][:maxcon_factor_nodejs_app] = 10
default[:haproxy][:maxcon_factor_nodejs_app_ssl] = 10
default[:haproxy][:maxcon_factor_java_app] = 10
default[:haproxy][:maxcon_factor_java_app_ssl] = 10
default[:haproxy][:maxcon_factor_static] = 15
default[:haproxy][:maxcon_factor_static_ssl] = 15

default[:haproxy][:balance] = 'roundrobin'

# include_attribute "haproxy::customize"
default[:haproxy][:enable_stats] = true
default[:haproxy][:stats_user] = 'opsworks'
default[:haproxy][:stats_password] = 'mieke_test'

# application environment attribute
#default[:haproxy][:server1] = 'ec2-54-149-91-232.us-west-2.compute.amazonaws.com'
#default[:haproxy][:server2] = 'ec2-54-149-117-33.us-west-2.compute.amazonaws.com'

default[:haproxy][:environment]='prod'
#ALPHA
default[:haproxy][:alpha_server1] = 'www.google.com'
default[:haproxy][:alpha_server2] = 'www.bing.com'

#BETA
default[:haproxy][:beta_server1] = 'www.yahoo.com'
default[:haproxy][:beta_server2] = 'www.amazon.com'

#PROD
default[:haproxy][:prod_server1] = 'www.bestbuys.com'
default[:haproxy][:prod_server2] = 'www.truecar.com'

