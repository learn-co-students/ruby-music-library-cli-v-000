module Concerns::Memorable
  module ClassMethods
    def create(name)
      new_instance = new(name)
      new_instance.save
      new_instance
    end

    def destroy_all
      self.all.clear
    end
  end

  module InstanceMethods
    def save
      self.class.all << self
    end
  end
end
