# frozen_string_literal: true

#
# Cookbook:: codenamephp_chef
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'codenamephp_chef::default' do
  context 'When all attributes are default (except ohai detected)' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new
      runner.converge(described_recipe)
    end
    before do
      stub_command('dpkg -l chefdk').and_return(true)
    end

    let(:execute) { chef_run.execute('curl -L https://omnitruck.chef.io/install.sh | sudo bash -s -- -P chefdk') }

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'will not install chefdk when the package is already installed' do
      expect(chef_run).to_not run_execute('curl -L https://omnitruck.chef.io/install.sh | sudo bash -s -- -P chefdk')
    end

    it 'can install chefdk using omintruk script when package is not yet installed' do
      stub_command('dpkg -l chefdk').and_return(false)
      expect(chef_run).to run_execute('curl -L https://omnitruck.chef.io/install.sh | sudo bash -s -- -P chefdk')
    end

    it 'can remove the script before and after the installtion' do
      expect(execute).to notify('file[Delete omnitruck install script]').to(:delete).before
      expect(execute).to notify('file[Delete omnitruck install script]').to(:delete).immediately
    end

    it 'will not delete the script on its own' do
      file = chef_run.file('Delete omnitruck install script')
      expect(file).to do_nothing
    end

    it 'will add shell init to all users with .bashrc file' do
      expect(chef_run).to does_append_if_no_line('add shell init to global .bashrc')
    end

    it 'will add USE_DOKKEN env variable to all users with .bashrc file' do
      expect(chef_run).to does_append_if_no_line('add USE_DOKKEN to global .bashrc')
    end

    
    it 'will add KITCHEN_LOCAL_YAML env variable to all users with .bashrc file' do
      expect(chef_run).to does_append_if_no_line('add KITCHEN_LOCAL_YAML to global .bashrc')
    end
  end
end
