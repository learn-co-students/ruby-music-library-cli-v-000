require 'bundler'
Bundler.require

module Concerns
  module Findable
    def self.create(objectName)
      object = self.new(objectName)
      object.save
      object
    end
  end
end

require_all 'lib'

