require 'bundler'
Bundler.require

module Concerns
  module Findable
    def self.extended(base)
      base.class_variable_set(:@@all,[])
    end
    def find_by_name(name)
      all.detect{|object| object.name == name}
    end

    def find_or_create_by_name(name)
      find_by_name(name) ? self.find_by_name(name) : self.create(name)
    end
  end

  module Createdestroy
    def create(name)
      name = self.new(name)
      name.save
      name
    end

    def destroy_all
      self.all.clear
    end
  end

  module Save
    def save
      self.class.all << self
    end

  end
end

require_all 'lib'

class Person
  extend Concerns::Findable
  extend Concerns::Createdestroy
end
