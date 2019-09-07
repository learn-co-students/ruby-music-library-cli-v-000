module Concerns
  module Findable
    def find_by_name(name)
      self.all.find {|song| song.name == name}
    end

    def find_or_create_by_name(name)
      unless self.find_by_name(name)
        self.create(name)
      else self.find_by_name(name)
      end
    end
  end
end
