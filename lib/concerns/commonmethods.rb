module Common

  module ClassMethods

    def create(name)
      self.new(name).tap { |instance|
        instance.save
      }
    end

    def all
      self.class_variable_get("@@all")
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

end#endof Common
