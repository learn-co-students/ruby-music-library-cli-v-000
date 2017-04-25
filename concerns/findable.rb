module Concerns
  module Findable
    def find_by_name(name)
      self.all.detect do |song|
        song.name == name
      end
    end

    def find_or_create_by_name(name)
      if found = self.find_by_name(name)
        found
      else
        self.create(name)
      end
    end

  end
end
