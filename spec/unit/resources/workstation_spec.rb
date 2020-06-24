# frozen_string_literal: true

require 'spec_helper'

describe 'codenamephp_chef_workstation' do
  platform 'debian' # https://github.com/chefspec/chefspec/issues/953

  step_into :codenamephp_chef_workstation

  context 'Minimal properties' do
    recipe do
      codenamephp_chef_workstation 'Install chef-workstation'
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'purges chefdk' do
      expect(chef_run).to purge_package('purge chefdk').with(package_name: 'chefdk')
    end

    it 'adds chef repository to apt' do
      expect(chef_run).to add_apt_repository('add chef repository to apt').with(
        key: ['https://packages.chef.io/chef.asc'],
        repo_name: 'chef-stable',
        uri: 'https://packages.chef.io/repos/apt/stable',
        components: ['main']
      )
    end

    it 'installs chef-workstation' do
      expect(chef_run).to install_package('install chef-workstation').with(package_name: 'chef-workstation')
    end
  end

  context 'Wit purge chefdk set to false' do
    recipe do
      codenamephp_chef_workstation 'Install chef-workstation' do
        purge_chefdk false
      end
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'will not purge chefdk' do
      expect(chef_run).to_not purge_package('purge chefdk')
    end
  end
end
