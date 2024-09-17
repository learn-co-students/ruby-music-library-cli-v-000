module Concerns
  module Findable
    def find_by_name(name)
      self.all.detect{|o| o.name == name}
    end

    def find_or_create_by_name(name)
      if self.find_by_name(name) != nil
        c = self.find_by_name(name)
      else
        c = self.create(name)
      end
      c
    end
  end
end
