default['elk']['cron']['dir'] = '/usr/local/lib/elasticsearch'
default['elk']['cron']['command'] = 'bash /usr/local/lib/elasticsearch/clean_index.sh'
default['elk']['cron']['threshold']['close'] = 31
default['elk']['cron']['threshold']['delete'] = 92
