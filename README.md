# Chef Cookbook Cookbooks

The default cookbook gets the environment ready to develop chef cookbooks by installing chefdk, vagrant, ruby, virtualbox, ...

## Requirements

### Supported Platforms

- Debian Jessie

### Chef

- Chef 12.1+

### Cookbook Depdendencies

- chef.cookbook.dev

## Usage

Add the cookbook to your Berksfile:

```ruby
cookbook 'chef.cookbook.cookbooks', '~> 0.1.0', github: 'codenamephp/chef.cookbook.cookbooks'
```

Add the cookbook to your runlist, e.g. in a role:

```json
{
  "name": "default",
  "chef_type": "role",
  "json_class": "Chef::Role",
  "run_list": [
	  "recipe[chef.cookbook.cookbooks]"
  ]
}
```
