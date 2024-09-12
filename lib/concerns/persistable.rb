module Persistable

  module InstanceMethods
    def save
      self.class.all << self
    end
  end

  module ClassMethods
    def destroy_all
      self.all.clear
    end

    def count
      self.all.size
    end

    def create(name)
      self.new(name).tap {|var| var.save}
    end
  end
end
