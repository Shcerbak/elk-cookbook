
repo = node['elk']['logstash']['repository']

apt_repository 'logstash-2.2.x.list' do
  uri repo['uri']
  distribution repo['dist']
  components repo['repo']
  action :add
end

package 'logstash' do # ~FC009
  version node['elk']['logstash']['version']
end

directory '/etc/pki/tls/certs' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
  recursive true
end

directory '/etc/pki/tls/private' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
  recursive true
end

template '/etc/ssl/openssl.cnf' do
  source 'openssl.cnf.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

execute 'openssl req -config /etc/ssl/openssl.cnf -x509 -days 3650 -batch -nodes -newkey rsa:2048 -keyout private/logstash-forwarder.key -out certs/logstash-forwarder.crt' do
  cwd '/etc/pki/tls'

  not_if { File.exist?('/etc/pki/tls/certs/logstash-forwarder.crt') }
end

template '/etc/logstash/conf.d/02-beats-input.conf' do
  source 'logstash/02-beats-input.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

template '/etc/logstash/conf.d/10-log-filter.conf' do
  source 'logstash/10-log-filter.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

template '/etc/logstash/conf.d/30-elasticsearch-output.conf' do
  source 'logstash/30-elasticsearch-output.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

service 'logstash' do
  action [:enable, :start]
end
