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
The `codenamephp_chef_workstation` installs the chef-workstation package from the apt repository. The repository is added automatically.

#### Actions
- `install`: Installs the resource

#### Properties
- `puge_chefdk`: Boolean to purge the chefdk (old package) prior to installing, defaults to false

#### Examples
```ruby
# Minimal properties
recipe do
  codenamephp_chef_workstation 'Install chef-workstation'
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