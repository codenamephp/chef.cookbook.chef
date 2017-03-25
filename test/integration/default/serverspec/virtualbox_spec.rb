require 'spec_helper'

describe package('virtualbox-4.3') do #TODO make version configurable
  it { should be_installed }
end

