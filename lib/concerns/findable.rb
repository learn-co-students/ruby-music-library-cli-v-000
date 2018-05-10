module Concerns::Findable

    def find_by_name(name)
      self.all.detect{|item| item.name == name}
    end

    def find_or_create_by_name(name)
      search = self.find_by_name(name)
      if !search
        self.create(name)
      else
        search
      end

    end

end
