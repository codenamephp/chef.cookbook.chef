require 'spec_helper'

describe 'Chef is installed and no junk is left behind' do
  describe package('chef') do
    it { should be_installed }
  end

  describe file('/tmp/chefdk.deb') do
    it { should_not exist }
  end
end