require 'bundler'
require 'pry'
Bundler.require

module Concerns
end

require_relative '../lib/concerns/findable'

require_all 'lib'
