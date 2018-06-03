# Inspec test for recipe codenamephp_mysql::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

control 'chef-1.0' do
  title 'Install chefdk'
  desc 'Install chefdk and remove the install script'

  describe package('chefdk') do
    it { should be_installed }
  end

  describe command('chef -v') do
    its(:exit_status) { should eq 0 }
    its(:stdout) { should match(/Chef Development Kit/) }
  end

  describe command('kitchen -v') do
    its(:exit_status) { should eq 0 }
    its(:stdout) { should match(/Test Kitchen/) }
  end

  describe file('/tmp/install.sh') do
    it { should_not exist }
  end
end
