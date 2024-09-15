module Concerns
  module Findable
    def find_by_name(name)
      self.all.find{|list| list.name == name}
    end

    def find_or_create_by_name(name)
      result = self.find_by_name(name)
      result ? result : self.create(name)
    end
  end
end
