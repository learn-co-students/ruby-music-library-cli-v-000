module Concerns
  module Findable
    def find_by_name(name)
      self.all.detect{|s| s.name == name}
    end

    def find_or_create_by_name(name)
      if new_one = self.all.detect{|s| s.name == name}
        new_one
      else
        new_one = self.new(name)
      end
    end
  end
end
