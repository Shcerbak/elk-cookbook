include_recipe 'cron'

directory node['elk']['cron']['dir'] do
  owner 'root'
  group 'root'
  mode '0755'
  recursive true
  action :create
end

template 'clean_index.sh' do
  path ::File.join(node['elk']['cron']['dir'], 'clean_index.sh')
  source 'clean_index.erb'
  owner 'root'
  group 'root'
  mode '755'
  variables(:thresholds => node['elk']['cron']['threshold'],
            :host => 'localhost',
            :port => 9200,
            :searchIndex => 'filebeat')
end

cron 'clean_index' do
  minute '23'
  hour '22'
  day '*'
  command node['elk']['cron']['command']
end
