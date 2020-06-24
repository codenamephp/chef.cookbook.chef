# frozen_string_literal: true

# Inspec test for recipe codenamephp_mysql::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

control 'chef-1.0' do
  title 'Install chef-workstation'
  desc 'Install chef-workstation and init the shell'

  describe package('chef-workstation') do
    it { should be_installed }
  end

  describe command('chef -v') do
    its('stdout') { should match(/Chef Workstation version:/) }
  end

  describe bash('sudo -iHu user1 printenv') do
    its('stdout') { should match(%r{PATH=/opt/chef-workstation/}) }
  end
end
