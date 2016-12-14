module Concerns
  module Findable
    def create(name)
      place = self.new(name)
      place.save
      place
    end

    def destroy_all
      self.all.clear
    end

    def find_by_name(name)
      place = self.all.select { |song| song.name == name }
      place[0]
    end

    def find_or_create_by_name(name)
      if find_by_name(name)
        find_by_name(name)
      else
        self.class.create(name)
      end
    end
  end

  module InstanceMethods
    def save
      self.class.all << self
    end

    def initialize(name)
      self.name = name
    end
  end
end