module Concerns
  module Findable
    def find_by_name(name)
      self.all.each do |a|
        if a.name == name
          return a
        end
      end
      return nil
    end

    def find_or_create_by_name(name)
      a = self.find_by_name(name)
      if a == nil
        a = self.create(name)
      end
      a
    end
  end

  module ClassMethods
    def destroy_all
      self.all.clear
    end

    def create(name)
      self.new(name).save
    end
  end

  module InstanceMethods
    def save
      self.class.all << self
      self
    end
  end
end
