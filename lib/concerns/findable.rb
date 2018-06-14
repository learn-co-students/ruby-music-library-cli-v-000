module Concerns
  module Findable

    def find_by_name(name)
      self.all.detect do
        |song| song.name == name
      end
    end

    def find_or_create_by_name(name)
      if self.find_by_name(name) == nil
        self.create(name)
      else
        self.find_by_name(name)
      end
    end
  end

#  module list
end
