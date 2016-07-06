module Persistable
  module ClassMethods
    def reset_all
      self.all.clear
    end

    def count
      self.all.size
    end
  end

  module InstanceMethods
      @@all = []

    def save
      self.class.all << self
    end

    def self.all
      self.class.all
    end
  end
end
