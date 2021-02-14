# frozen_string_literal: true

require 'spec_helper'

describe 'codenamephp_chef_environment' do
  platform 'debian' # https://github.com/chefspec/chefspec/issues/953

  step_into :codenamephp_chef_environment

  context 'Minimal properties' do
    recipe do
      codenamephp_chef_environment 'Setup chef' do
        users %w(user1 user2)
      end
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'adds bash init' do
      expect(chef_run).to add_codenamephp_bash_cookbook_file('setup bash').with(
        users: %w(user1 user2),
        filename: '100-chef',
        cookbook_file: 'chef-init',
        cookbook: 'codenamephp_chef',
        skel: false
      )
    end
  end

  context 'With skel set to true' do
    recipe do
      codenamephp_chef_environment 'Setup chef' do
        users %w(user1 user2)
        skel true
      end
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'adds bash init' do
      expect(chef_run).to add_codenamephp_bash_cookbook_file('setup bash').with(
        users: %w(user1 user2),
        filename: '100-chef',
        cookbook_file: 'chef-init',
        cookbook: 'codenamephp_chef',
        skel: true
      )
    end
  end
end
