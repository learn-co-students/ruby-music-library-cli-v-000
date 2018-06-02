
module Common
  module InstanceMethods
    def save
      self.class.all << self
    end
  end

  module ClassMethods
    def destroy_all
      all.clear
    end

    def create(name)
      new(name).tap { |thing| thing.save }
    end
  end
end
