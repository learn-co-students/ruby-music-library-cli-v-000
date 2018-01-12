module Concerns::Persistable
#==============================================
  module ClassMethods
#==============================================
    def create(name)
      obj = self.new(name).tap {|o| o.save}
    end

    def destroy_all
      self.all.clear
    end

    def self.extended(base)
      base.class_variable_set(:@@all, [])
    end
    
    def all
      self.class_variable_get(:@@all)
    end
#==============================================    
  end
#==============================================
  module InstanceMethods
#==============================================
    def initialize(name)
      self.songs = []
      self.name = name
    end
    
    def save
      self.class.all << self
    end
#==============================================
  end
end 
