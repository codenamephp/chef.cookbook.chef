require 'spec_helper'

describe package('virtualbox-5.1') do #TODO make version configurable
  it { should be_installed }
end

