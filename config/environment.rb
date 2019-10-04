require 'bundler'
Bundler.require

module Concerns

  module Findable
    def find_by_name(name)
      self.all.detect {|object| object.name == name}
    end

    def find_or_create_by_name(name)
      return self.find_by_name(name) if self.find_by_name(name) # if object is found, return it.
      # otherwise, create it
      self.create(name)
    end
  end

end

require_all 'lib'
