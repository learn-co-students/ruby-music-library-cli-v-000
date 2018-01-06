module Concerns::Persistable
  module ClassMethods
    def create(name)
      obj = self.new(name).tap {|o| o.save}
    end

    def destroy_all
      self.all.clear
    end

    def self.extended(base)
      base.class_variable_set(:@@all, [])
      # base.class_variable_set(:all, :@@all)
      # successfully got rid of @all = []
      # trying to abstract away def self.all .. @@all
    end


  end

  module InstanceMethods
    def initialize(name)
      self.songs = []
      self.name = name
    end
  end

  module Save
    def save
      self.class.all << self
    end
  end
end
