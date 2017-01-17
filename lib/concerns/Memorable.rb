module Memorable
  module ClassMethods

    def create(name)
      new(name).tap {|x| x.save}
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
