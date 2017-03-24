module Persistable
  module InstanceMethods
    def save
      self.class.all << self
    end
  end

  module ClassMethods
    def self.extended(base) #This is the method where self is Persistable::ClassMethods.
      #This method will file even before console will load.
      puts "#{base} ahs been extended by #{self}."
      #Song has been extended by Persisitable::ClassMethods.
      #Artsist has been extended by Persisitable::ClassMethods.
      #Genre has been extended by Persisitable::ClassMethods.
      base.class_variable_set(:@@all, [])#This will set class variable @@all = [] to all of the classes.
    end

    def destroy_all
      self.all.clear
    end
    def count
      self.all.size
    end
  end
end
