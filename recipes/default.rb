package 'unzip' do
  action :install
end

include_recipe 'apt'
include_recipe 'java-oracle'
include_recipe 'elk::elasticsearch'
include_recipe 'elk::kibana'
include_recipe 'elk::nginx'
include_recipe 'elk::logstash'
include_recipe 'elk::dashboards'
include_recipe 'elk::cron'
