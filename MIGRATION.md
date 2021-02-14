# 2 -> 3

The repository isn't added automatically anymore. Also the 'current' channel is now the default (was 'stable' before).

To keep the current behavior add the `codenamephp_chef_repository` resource first and set the `channel` property to 'stable'

```ruby
codenamephp_chef_workstation 'Install chef-workstation'
```

becomes

```ruby
codenamephp_chef_repository 'Add chef repository' do
  channel 'stable'
end
codenamephp_chef_workstation 'Install chef-workstation'
```

If you don't care about the repository you can also set the `add_default_chef_repo` property to true i the `resource`

```ruby
codenamephp_chef_workstation 'Install chef-workstation'
  add_default_chef_repo true
end
```

Keep in mind that you lose control over the repo settings.

It's recommended to switch to the 'current' channel for development:

```ruby
codenamephp_chef_repository 'Add chef repository'
codenamephp_chef_workstation 'Install chef-workstation'
```