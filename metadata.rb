name             'elk'
maintainer       'Shcerbak'
maintainer_email 'shcerbak@gmail.com'
license          'apache 2'
description      'configure elk'
long_description 'configure elk'
issues_url       'https://github.com/shcerbak/elk-cookbook/issues' if respond_to?(:issues_url)
source_url       'https://github.com/shcerbak/elk-cookbook' if respond_to?(:source_url)
version          '0.1.0'

depends 'apt', '>= 2.8'
depends 'java-oracle'
depends 'nginx'
depends 'htpasswd'
depends 'cron'
