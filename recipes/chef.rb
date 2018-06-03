package 'Install curl' do
  package_name 'curl'
end

execute 'Install chefdk with omnitruck' do
  command 'curl -L https://omnitruck.chef.io/install.sh | sudo bash -s -- -P chefdk'
  notifies :delete, 'file[Delete omnitruck install script]', :before
  notifies :delete, 'file[Delete omnitruck install script]', :immediately
end

file 'Delete omnitruck install script' do
  action :nothing
  path '/tmp/install.sh'
end

append_if_no_line 'add shell init to global .bashrc' do
  path '/etc/bash.bashrc'
  line 'eval "$(chef shell-init bash)"'
end
