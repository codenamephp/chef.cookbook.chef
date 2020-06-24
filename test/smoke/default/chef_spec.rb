# frozen_string_literal: true

# Inspec test for recipe codenamephp_mysql::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

control 'chef-1.0' do
  title 'Install chefdk'
  desc 'Install chefdk, remove the install script and init the shell'
end
