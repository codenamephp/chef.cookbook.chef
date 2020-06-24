# frozen_string_literal: true

property :users, Array, required: true, description: 'An array of usernames to setup the environment for'
property :skel, [true, false], default: false, description: 'Flag if /etc/skel should receive the environment too for newly created users, defaults to false'
property :cookbook, String

action :install do
  codenamephp_bash_manage 'manage bash' do
    users new_resource.users
    skel new_resource.skel
  end

  codenamephp_bash_cookbook_file 'setup bash' do
    users new_resource.users
    filename '100-chef'
    cookbook_file 'chef-init'
    cookbook 'codenamephp_chef'
    skel new_resource.skel
  end
end
