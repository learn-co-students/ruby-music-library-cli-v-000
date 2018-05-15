require 'bundler'
Bundler.require

module Concerns
  module Findable
    def find_by_name(name)
      self.all.detect {|o| o.name == name}
    end

    def create(name)
      instance = self.new(name)
      instance.save
      instance
    end

    def find_or_create_by_name(name)
      find_by_name(name) ? find_by_name(name) : create(name)
    end
  end
end

require_all 'lib'
