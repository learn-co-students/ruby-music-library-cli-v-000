module Concerns::Findable
    def find_by_name(name)
      self.all.detect{|o| o.name == name}
    end

end
