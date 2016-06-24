module Concerns

  module Findable
    attr_accessor :name

    def self.included(klass)
      klass.extend(ClassMethods)
    end

    def initialize(name)
      @name = name
      @songs = []
    end

    def save
      self.class.all << self
    end
  end # Findable module


  module ClassMethods

    def create(name)
      obj = new(name)
      obj.save
      obj
    end

    def destroy_all
      self.all.clear
    end

    def find_by_name(name)
      self.all.find do |obj|
        obj.name == name
      end
    end

    def find_or_create_by_name(name)
      self.find_by_name(name) || self.create(name)
    end
  end # ClassMethods module

end # Concerns module


# included to prevent 008_findable_module_spec.rb from failing
class Person
  include Concerns::Findable
end
