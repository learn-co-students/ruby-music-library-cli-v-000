module Concerns
  module Findable 

    def create(name)
      object = self.new(name)
      object.save
      object
    end

    def find_by_name(name)
      self.all.detect {|object| object.name == name} 
    end

    def find_or_create_by_name(name)
      self.find_by_name(name) ? self.find_by_name(name) : self.create(name) #find any objects that match name; if no matches, create object
    end
  end

  module Basics
    def destroy_all
      self.all.clear
    end
  end

  module FindableInstance
    def save
      self.class.all << self
    end
  end

end