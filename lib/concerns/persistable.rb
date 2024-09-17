module Concerns::Persistable

  module InstanceMethods

    def save #Instance
      self.class.all << self
    end

  end

  module ClassMethods

    def self.extended(base)
      puts "#{base} has been extended by #{self}"
      base.class_variable_set(:@@all, [])
    end

    def destroy_all #class
      self.all.clear
    end

    def count #class
      self.all.size
    end

  end

end
