default['elk']['elasticsearch']['repository']['uri'] = 'http://packages.elastic.co/elasticsearch/2.x/debian'
default['elk']['elasticsearch']['repository']['dist'] = 'stable'
default['elk']['elasticsearch']['repository']['repo'] = ['main']
default['elk']['elasticsearch']['repository']['key'] = 'https://packages.elastic.co/GPG-KEY-elasticsearch'
default['elk']['elasticsearch']['version'] = '2.4.1'

default['elk']['elasticsearch']['conf']['network.host'] = 'localhost'
default['elk']['elasticsearch']['conf']['http.port'] = 9200
