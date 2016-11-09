repo = node['elk']['elasticsearch']['repository']

apt_repository 'elasticsearch-2.x.list' do
  uri repo['uri']
  distribution repo['dist']
  components repo['repo']
  key repo['key']
  action :add
end

package 'elasticsearch' do
  version node['elk']['elasticsearch']['version']
end

template '/etc/elasticsearch/elasticsearch.yml' do
  source 'conf.erb'
  owner 'root'
  group 'elasticsearch'
  mode '0750'

  variables config: node['elk']['elasticsearch']['conf']
end

service 'elasticsearch' do
  action [:enable, :start]
end

execute 'elasticsearch/bin/plugin install mobz/elasticsearch-head' do
  cwd '/usr/share'

  not_if { File.directory?('/usr/share/elasticsearch/plugins/head') }
end
