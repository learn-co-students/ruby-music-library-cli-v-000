require 'bundler'
Bundler.require

module Concerns
end

require_relative './concerns/findable.rb'
require_all 'lib'
