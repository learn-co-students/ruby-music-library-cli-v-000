module Memorable
  module ClassMethods
    def destroy_all
      self.all.clear
    end

    def create(name)
      self.new(name).save
    end

    def find_by_name(name)
      self.all.detect {|song| song.name == name }
    end

    def find_or_create_by_name(name)
      if self.find_by_name(name) == nil
        self.create(name)
      else
        self.find_by_name(name)
      end
    end

  end


  module InstanceMethods

    def save
      self.class.all << self
      self
    end
  end

end
