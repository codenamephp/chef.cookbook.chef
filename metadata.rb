# frozen_string_literal: true

name 'codenamephp_chef'
maintainer 'Bastian Schwarz'
maintainer_email 'basitan@codename-php.de'
license 'Apache-2.0'
description 'Gets the environment ready to develop chef cookbooks by installing chefdk'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '2.0.0'
chef_version '>= 13.0' if respond_to?(:chef_version)
issues_url 'https://github.com/codenamephp/chef.cookbook.cookbooks/issues' if respond_to?(:issues_url)
source_url 'https://github.com/codenamephp/chef.cookbook.cookbooks' if respond_to?(:source_url)

supports 'debian', '~>10.0'

depends 'line', '~>2.0.0'
