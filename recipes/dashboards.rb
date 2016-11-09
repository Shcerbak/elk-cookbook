beats_dashboards_zip = ::File.join(Chef::Config[:file_cache_path], 'beats-dashboards.zip')
version = node['elk']['beats-dashboards']['version']
remote_file beats_dashboards_zip do
  owner 'root'
  group 'root'
  mode '0644'
  source "https://download.elastic.co/beats/dashboards/beats-dashboards-#{version}.zip"
  notifies :run, 'execute[unzip]', :immediately
end

execute 'unzip' do
  command "unzip #{beats_dashboards_zip} -d /usr/local"
  notifies :run, 'execute[load_dashboards]', :immediately
  not_if { File.directory?("/usr/local/beats-dashboards-#{version}") }
end

execute 'load_dashboards' do
  command 'bash load.sh'
  cwd "/usr/local/beats-dashboards-#{version}"
  action :nothing
end

execute 'filebeat-index-template' do
  command 'curl -O https://gist.githubusercontent.com/thisismitch/3429023e8438cc25b86c/raw/d8c479e2a1adcea8b1fe86570e42abab0f10f364/filebeat-index-template.json'
  cwd '/usr/local/'
  notifies :run, 'execute[load_filebeat-index-template]', :immediately
  not_if { File.exist?('/usr/local/filebeat-index-template.json') }
end

execute 'load_filebeat-index-template' do
  command "curl -XPUT 'http://localhost:9200/_template/filebeat?pretty' -d@filebeat-index-template.jso"
  cwd '/usr/local/'
  action :nothing
end
