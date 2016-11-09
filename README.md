# Description

This cookbook installs ELK.

# Usage

include_recipe 'elk::default'

Add `default['elk']['kibana']['htpasswd']['users'][user_name] = password` if you want to add basic authentication

# Requirements

## Platform:

*No platforms defined*

## Cookbooks:

* apt (>= 2.8)
* java-oracle
* nginx
* htpasswd
* cron

# Attributes

* `node['elk']['cron']['dir']` -  Defaults to `/usr/local/lib/elasticsearch`.
* `node['elk']['cron']['command']` -  Defaults to `bash /usr/local/lib/elasticsearch/clean_index.sh`.
* `node['elk']['cron']['threshold']['close']` -  Defaults to `31`.
* `node['elk']['cron']['threshold']['delete']` -  Defaults to `92`.
* `node['elk']['beats-dashboards']['version']` -  Defaults to `1.1.0`.
* `node['elk']['elasticsearch']['repository']['uri']` -  Defaults to `http://packages.elastic.co/elasticsearch/2.x/debian`.
* `node['elk']['elasticsearch']['repository']['dist']` -  Defaults to `stable`.
* `node['elk']['elasticsearch']['repository']['repo']` -  Defaults to `[ ... ]`.
* `node['elk']['elasticsearch']['repository']['key']` -  Defaults to `https://packages.elastic.co/GPG-KEY-elasticsearch`.
* `node['elk']['elasticsearch']['version']` -  Defaults to `2.4.1`.
* `node['elk']['elasticsearch']['conf']['network.host']` -  Defaults to `localhost`.
* `node['elk']['elasticsearch']['conf']['http.port']` -  Defaults to `9200`.
* `node['elk']['kibana']['repository']['uri']` -  Defaults to `http://packages.elastic.co/kibana/4.4/debian`.
* `node['elk']['kibana']['repository']['dist']` -  Defaults to `stable`.
* `node['elk']['kibana']['repository']['repo']` -  Defaults to `[ ... ]`.
* `node['elk']['kibana']['version']` -  Defaults to `4.4.2`.
* `node['elk']['kibana']['conf']['server.host']` -  Defaults to `localhost`.
* `node['elk']['logstash']['repository']['uri']` -  Defaults to `http://packages.elastic.co/logstash/2.2/debian`.
* `node['elk']['logstash']['repository']['dist']` -  Defaults to `stable`.
* `node['elk']['logstash']['repository']['repo']` -  Defaults to `[ ... ]`.
* `node['elk']['logstash']['version']` -  Defaults to `1:2.2.4-1`.
* `node['elk']['kibana']['htpasswd']['path']` -  Defaults to `/etc/nginx/.htpasswd_kibana`.
* `node['nginx']['default_site_enabled']` -  Defaults to `false`.

# Recipes

* elk::cron
* elk::dashboards
* elk::default
* elk::elasticsearch
* elk::kibana
* elk::logstash
* elk::nginx

# License and Maintainer

Maintainer:: Shcerbak (<shcerbak@gmail.com>)
Source:: https://github.com/shcerbak/elk-cookbook
Issues:: https://github.com/shcerbak/elk-cookbook/issues

License:: apache 2
