require 'bundler'
Bundler.require

require_relative '../lib/concerns/findable_module.rb'

module Concerns
end

require_all 'lib'
require 'pry'
