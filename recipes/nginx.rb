include_recipe 'nginx'

users = node['elk']['kibana']['htpasswd']['users']

if users.nil?
  file node['elk']['kibana']['htpasswd']['path'] do
    action :delete
  end
else
  users.each_pair do |name, opts|
    htpasswd node['elk']['kibana']['htpasswd']['path'] do
      user name
      password opts
    end
  end
end

template ::File.join(node['nginx']['dir'], 'sites-available', 'kibana') do
  source 'kibana.conf.erb'
  notifies :reload, 'service[nginx]'
  variables(:use_auth_basic => users || false,
            :host => node['ipaddress'])
end

nginx_site 'kibana'
