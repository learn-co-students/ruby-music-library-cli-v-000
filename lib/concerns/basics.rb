module Basics

  module InstanceMethods
    def save
      self.class.all << self unless self.class.all.any? {|object| object == self}
    end
  end

  module ClassMethods
    def destroy_all
      all.clear
    end

    def create(name)
      object = self.new(name)
      object.save
      object
    end
  end

end
