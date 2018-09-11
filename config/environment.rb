require 'bundler'
Bundler.require

module Concerns
  module Findable
    def find_by_name(name)
      self.all.detect {|a| a.name == name}
    end
    def self.create(name)
      self.new(name).tap {|a| a.save}
    end
    def self.find_or_create_by_name(name)
      find_by_name(name) || create(name)
    end
  end
end

require_all 'lib'
