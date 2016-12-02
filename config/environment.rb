require 'bundler'
require './concerns/Findable.rb'
require './concerns/NewModules.rb'
Bundler.require

module Concerns
end

module Concerns::Findable
end

module NewModules
end

module NewModules::ClassMethods
end

module NewModules::InstanceMethods
end

require_all 'lib'
