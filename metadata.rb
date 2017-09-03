name 'chef.cookbook.cookbooks'
maintainer 'Bastian Schwarz'
maintainer_email 'basitan@codename-php.de'
license 'Apache-2.0'
description 'Gets the environment ready to develop chef cookbooks by installing chefdk, vagrant, ruby, virtualbox, ...'
long_description 'Gets the environment ready to develop chef cookbooks by installing chefdk, vagrant, ruby, virtualbox, ...'
version '0.3.1'
chef_version '>= 13.0' if respond_to?(:chef_version)
issues_url 'https://github.com/codenamephp/chef.cookbook.cookbooks/issues' if respond_to?(:issues_url)
source_url 'https://github.com/codenamephp/chef.cookbook.cookbooks' if respond_to?(:source_url)

supports 'debian', '~>9.1'
