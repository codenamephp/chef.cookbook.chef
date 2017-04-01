name 'chef.cookbook.cookbooks'
maintainer 'Bastian Schwarz'
maintainer_email 'basitan@codename-php.de'
license 'Apache v2.0'
description 'Gets the environment ready to develop chef cookbooks by installing chefdk, vagrant, ruby, virtualbox, ...'
long_description 'Gets the environment ready to develop chef cookbooks by installing chefdk, vagrant, ruby, virtualbox, ...'
version '0.1.0'
issues_url 'https://github.com/codenamephp/chef.cookbook.cookbooks/issues' if respond_to?(:issues_url)
source_url 'https://github.com/codenamephp/chef.cookbook.cookbooks' if respond_to?(:source_url)

depends 'apt'
depends 'chef.cookbook.dev'

supports 'debian', '~>8.5'
