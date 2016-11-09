This cookbook installs ELK.

# Usage

include_recipe 'elk::default'

Add `default['elk']['kibana']['htpasswd']['users'][user_name] = password` if you want to add basic authentication
