# Chef Cookbook Chef

The default cookbook gets the environment ready to develop chef cookbooks by installing chefdk

## Requirements

### Supported Platforms

- Debian Stretch

### Chef

- Chef 13.0+

### Cookbook Depdendencies

## Usage

Add the cookbook to your Berksfile:

```ruby
cookbook 'codenamephp_chef', '~> 1.0.0'
```

Add the cookbook to your runlist, e.g. in a role:

```json
{
  "name": "default",
  "chef_type": "role",
  "json_class": "Chef::Role",
  "run_list": [
	  "recipe[codenamephp_chef]"
  ]
}
```
