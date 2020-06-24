# frozen_string_literal: true

property :purge_chefdk, [true, false], default: true, description: 'Flag if the chefdk package should be purged before installing chef workstation'

action :install do
  package 'purge chefdk' do
    package_name 'chefdk'
    action :purge
    only_if { new_resource.purge_chefdk }
  end

  apt_repository 'add chef repository to apt' do
    key 'https://packages.chef.io/chef.asc'
    repo_name 'chef-stable'
    uri 'https://packages.chef.io/repos/apt/stable'
    components ['main']
  end

  package 'install chef-workstation' do
    package_name 'chef-workstation'
  end
end
