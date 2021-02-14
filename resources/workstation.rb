# frozen_string_literal: true

property :purge_chefdk, [true, false], default: true, description: 'Flag if the chefdk package should be purged before installing chef workstation'
property :add_default_chef_repo, [true, false], default: false, description: 'Flag if the default repo should be added using the codenamephp_chef_repository resource with default parameters'

action :install do
  package 'purge chefdk' do
    package_name 'chefdk'
    action :purge
    only_if { new_resource.purge_chefdk }
  end

  codenamephp_chef_repository 'add chef repository' do
    only_if { new_resource.add_default_chef_repo }
  end

  package 'install chef-workstation' do
    package_name 'chef-workstation'
  end
end
