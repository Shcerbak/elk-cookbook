repo = node['elk']['kibana']['repository']

apt_repository 'kibana-4.4.x.list' do
  uri repo['uri']
  distribution repo['dist']
  components repo['repo']
  action :add
end

package 'kibana' do # ~FC009
  version node['elk']['kibana']['version']
end

template '/opt/kibana/config/kibana.yml' do
  source 'conf.erb'
  owner 'root'
  group 'root'
  mode '0664'

  variables config: node['elk']['kibana']['conf']
end

service 'kibana' do
  action [:enable, :start]
end
