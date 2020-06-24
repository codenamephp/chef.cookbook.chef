# frozen_string_literal: true

#
# Cookbook:: codenamephp_chef
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'codenamephp_chef::default' do
  context 'When all attributes are default (except ohai detected)' do
    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
