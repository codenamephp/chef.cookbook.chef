# frozen_string_literal: true

require 'chefspec'
require 'chefspec/berkshelf'
require_relative 'support/matchers'

RSpec.configure do |config|
  # Specify the operating platform to mock Ohai data from (default: nil)
  config.platform = 'debian'

  # Specify the operating version to mock Ohai data from (default: nil)
  config.version = '9.2'
end
