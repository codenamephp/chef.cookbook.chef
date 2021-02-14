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

    it 'doesnt add repository to apt' do
      expect(chef_run).to_not add_codenamephp_chef_repository('add chef repository')
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

  context 'With add_default_chef_repo set to true' do
    recipe do
      codenamephp_chef_workstation 'Install chef-workstation' do
        add_default_chef_repo true
      end
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'adds repository to apt' do
      expect(chef_run).to add_codenamephp_chef_repository('add chef repository')
    end
  end
end
