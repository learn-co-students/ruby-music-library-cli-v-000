module Concerns
  module Findable
    def find_by_name(name)
      self.all.detect{|category| category.name == name}
    end

    def find_or_create_by_name(name)
      if !self.all.detect{|category| category.name == name}
        self.create(name)
      else
        self.find_by_name(name)
      end
    end
  end
end