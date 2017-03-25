#
# Cookbook:: chef.cookbooks
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'chef.cookbook.cookbooks::chef'
include_recipe 'chef.cookbook.cookbooks::vagrant'
include_recipe 'chef.cookbook.cookbooks::virtualbox'
