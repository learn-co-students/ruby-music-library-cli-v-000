require 'bundler'
Bundler.require

module Concerns
end

load './lib/concerns/findable.rb'
require_all 'lib'
