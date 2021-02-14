property :channel, %w(stable current), default: 'current', description: 'The channel to use for the repository'

action :add do
  apt_repository 'add chef repository to apt' do
    key 'https://packages.chef.io/chef.asc'
    repo_name 'chef'
    uri "https://packages.chef.io/repos/apt/#{new_resource.channel}"
    components ['main']
  end
end

action :remove do
  apt_repository 'remove chef repository from apt' do
    repo_name 'chef'
    action :remove
  end
end
