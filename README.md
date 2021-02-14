# Chef Cookbook Chef
[![Build Status](https://travis-ci.com/codenamephp/chef.cookbook.chef.svg?branch=master)](https://travis-ci.com/codenamephp/chef.cookbook.chef)

The default cookbook gets the environment ready to develop chef cookbooks by installing chef-workstation.

## Requirements

### Supported Platforms

- Debian Buster

### Chef

- Chef 13.0+

### Cookbook Depdendencies

## Usage

Add the cookbook as a dependency, e.g. in your Berksfile:

```ruby
cookbook 'codenamephp_chef', '~> 2.0.0'
```

Then use the resource in your recipes.

## Resources

### Workstation
The `codenamephp_chef_workstation` installs the chef-workstation package from the apt repository. The repository is not added automatically! You
use `codenamephp_chef_repository` first or add the repository yourself. If you don't care at all about the repository you can set the
`add_default_chef_repo` property to true. It then calls the repository resource for you with its defaults which means you lose control over the
repository settings.

#### Actions
- `install`: Installs the resource

#### Properties
- `puge_chefdk`: Boolean to purge the chefdk (old package) prior to installing, defaults to false
- `add_default_chef_repo`: Boolean to add the default chef repo using the codenamephp_chef_repository with the default values.
  It's recommended that you use the resource yourself beforehand but this is a nice shortcut if you don't care about the repo and just need any
  chef workstation version
#### Examples
```ruby
# Minimal properties
recipe do
  codenamephp_chef_workstation 'Install chef-workstation'
end

# add chef repo
recipe do
  codenamephp_chef_workstation 'Install chef-workstation' do
    add_default_chef_repo true
  end
end

# don't purge chefdk
recipe do
  codenamephp_chef_workstation 'Install chef-workstation' do
    purge_chefdk false
  end
end
```

### Environment
The `codenamephp_chef_environment` resource adds the chef init command and the chef ruby bin to path by using `codenamephp_bash` to manage bashrc.d
configs for the given user.

#### Actions
- `install`: Installs the bash files to init chef

#### Properties
- `users`: Array of usernames as strings for which the envirnment should be installed
- `skel`: Boolean to enable the management of `/etc/skel` so users that are created after chef will get the chef init as well, defaults to false

#### Examples
```ruby
# Minimal properties
codenamephp_chef_environment 'Setup chef' do
  users %w[user1 user2]
end

# also manage skel
recipe do
  codenamephp_chef_environment 'Setup chef' do
    users %w[user1 user2]
    skel true
  end
end
```

### Repository
The `codenamephp_chef_repository` resource adds the chef repository to apt so the workstation resource can do its thing. Should be used before `codenamephp_chef_workstation`

#### Actions
- `install`: Installs the repository
- `remove`: Removes the repository

#### Properties
- `channel`: (stable|current) Sets the channel to use for apt. Defaults to 'current' so the latest version is used

#### Examples
```ruby
# Minimal properties
codenamephp_chef_environment 'Setup chef' do
  users %w[user1 user2]
end

# also manage skel
recipe do
  codenamephp_chef_environment 'Setup chef' do
    users %w[user1 user2]
    skel true
  end
end
```