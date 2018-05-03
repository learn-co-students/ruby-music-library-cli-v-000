module Concerns
  module Findable
    def find_by_name(name)
      self.all.find {|object| object.name == name}
    end

    def create(name)
      new_object = self.new(name)
      new_object.save
      new_object
    end

    def find_or_create_by_name(name)
      if self.find_by_name(name)
        self.find_by_name(name)
      else
        self.create(name)
      end
    end
  end
end
