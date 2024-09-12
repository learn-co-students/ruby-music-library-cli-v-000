module NewModules
  module ClassMethods

    @@all = []

    def all
      @@all
    end

    def destroy_all
      @@all.clear
    end

    def create(name)
      created = self.new(name)
      created.save
      created
      #binding.pry
    end
  end

  module InstanceMethods

    def save
      self.class.all << self
      #binding.pry
    end
  end
end
