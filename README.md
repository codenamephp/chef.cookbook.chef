# Chef Cookbook Cookbooks

The default cookbook gets the environment ready to develop chef cookbooks by installing chefdk, vagrant and virtualbox.

## Requirements

### Supported Platforms

- Debian Stretch

### Chef

- Chef 13.0+

### Cookbook Depdendencies

- apt
- chef.cookbook.dev

## Usage

Add the cookbook to your Berksfile:

```ruby
cookbook 'chef.cookbook.cookbooks', '~> 0.3.0', github: 'codenamephp/chef.cookbook.cookbooks'
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
