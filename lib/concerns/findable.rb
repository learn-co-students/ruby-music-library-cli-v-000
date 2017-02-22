
module Concerns::Findable

    def find_by_name(name)
      self.all.detect {|a| a.name == name}
    end

    def find_or_create_by_name(name)
      item = self.all.detect {|a| a.name == name}
      if item == nil
        item = self.create(name)
        item
      else
        item
      end
    end
end
