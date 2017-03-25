include_recipe 'dev::gdebi'

remote_file 'Get package from chef' do
  path '/tmp/chefdk.deb' #TODO make path configurable
  source 'https://packages.chef.io/files/stable/chefdk/1.2.22/debian/8/chefdk_1.2.22-1_amd64.deb' #TODO make url configurable
  not_if "dpkg -l chef"
  notifies :run, 'execute[add chefdk from package]', :immediately
end

execute 'add chefdk from package' do
  command 'sudo gdebi --n /tmp/chefdk.deb'
  action :nothing
  notifies :delete, 'file[Delete chefdk package download]', :immediately
end

file 'Delete chefdk package download' do
  action :nothing
  path '/tmp/chefdk.deb'
  backup false
  only_if { ::File.exist?('/tmp/chefdk.deb') }
end