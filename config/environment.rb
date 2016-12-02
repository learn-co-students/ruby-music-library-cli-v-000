require 'bundler'
require './concerns/Findable.rb'
require './concerns/NewModules.rb'
Bundler.require

module Concerns
end

module Concerns::Findable
end

module Concerns::NewModules
end

require_all 'lib'
