module Concerns
  module Findable
    def find_by_name(name)
      self.all.detect {|song| song.name == name}
    end

    def find_or_create_by_name(name)
      detected = self.all.detect {|song| song.name == name}
      if detected
        return detected
      else
        self.create(name)
      end
    end
  end
end
