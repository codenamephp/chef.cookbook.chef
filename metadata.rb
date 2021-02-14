# frozen_string_literal: true

name 'codenamephp_chef'
maintainer 'Bastian Schwarz'
maintainer_email 'basitan@codename-php.de'
license 'Apache-2.0'
description 'Provides resources to install chef-workstation'
version '3.0.1'
chef_version '>= 13.0'
issues_url 'https://github.com/codenamephp/chef.cookbook.chef/issues'
source_url 'https://github.com/codenamephp/chef.cookbook.chef'

supports 'debian'

depends 'codenamephp_bash', '~> 2.1'
