require 'spec_helper'

describe 'Chef is installed and no junk is left behind' do
  describe package('chef') do
    it { should be_installed }
  end

  describe command('chef -v') do
    its(:exit_status) { should eq 0 }
    its(:stdout) { should match /Chef Development Kit/ }
  end
  
  describe command('kitchen -v') do
    its(:exit_status) { should eq 0 }
    its(:stdout) { should match /Test Kitchen/ }
  end
  
  describe file('/tmp/install.sh') do
    it { should_not exist }
  end
end