module Concerns::Memorable
  module ClassMethods
    
    @@all = []

    def all
      @@all
    end
    
     def destroy_all
     self.all.clear
     end
  end

  module InstanceMethods

    def initialize(name)
      @name = name
    end


    def save
      self.class.all << self
    end
  end


end