package 'Install curl' do
  package_name 'curl'
end

execute 'Install chefdk with omnitruck' do
  command 'curl -L https://omnitruck.chef.io/install.sh | sudo bash'
  notifies :delete, 'file[Delete omnitruck install script]', :before
  notifies :delete, 'file[Delete omnitruck install script]', :immediately
end

file 'Delete omnitruck install script' do
  action :nothing
  path '/tmp/install.sh'
end
