require 'bundler'
Bundler.require

module Concerns
  module Findable
    def self.create(objectName)
      object = self.new(objectName)
      object.save
      object
    end
    
    def self.find_by_name(objectName)
      self.all.find {|object| object.name == objectName }
    end
  end
end

require_all 'lib'

