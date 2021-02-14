# frozen_string_literal: true

require 'spec_helper'

describe 'codenamephp_chef_repository' do
  platform 'debian' # https://github.com/chefspec/chefspec/issues/953

  step_into :codenamephp_chef_repository

  context 'Minimal properties' do
    recipe do
      codenamephp_chef_repository 'Add chef repo'
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'adds chef repository to apt' do
      expect(chef_run).to add_apt_repository('add chef repository to apt').with(
        key: ['https://packages.chef.io/chef.asc'],
        repo_name: 'chef',
        uri: 'https://packages.chef.io/repos/apt/current',
        components: ['main']
      )
    end
  end

  context 'With channel set to stable' do
    recipe do
      codenamephp_chef_repository 'Add chef repo' do
        channel 'stable'
      end
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'adds chef repository to apt' do
      expect(chef_run).to add_apt_repository('add chef repository to apt').with(
        key: ['https://packages.chef.io/chef.asc'],
        repo_name: 'chef',
        uri: 'https://packages.chef.io/repos/apt/stable',
        components: ['main']
      )
    end
  end

  context 'Can remove repo' do
    recipe do
      codenamephp_chef_repository 'Add chef repo' do
        action :remove
      end
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'removes repository from apt' do
      expect(chef_run).to remove_apt_repository('remove chef repository from apt')
    end
  end
end
