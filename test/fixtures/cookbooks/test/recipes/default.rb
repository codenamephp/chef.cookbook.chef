# frozen_string_literal: true

user 'create user 1' do
  manage_home true
  username 'user1'
  shell '/bin/bash'
end

codenamephp_chef_workstation 'Install chef-workstation'
codenamephp_chef_environment 'Setup chef environment' do
  users ['user1']
  cookbook 'codenamephp_chef'
end
