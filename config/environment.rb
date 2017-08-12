require 'bundler'
Bundler.require

module Concerns
  module Findable
  end
end

require_all 'lib'

require_relative '../lib/concerns/findable'
