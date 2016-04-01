module Concerns

  module Findable
    def find_by_name(name)
      self.all.detect { |x| x.name == name }
    end

    def find_or_create_by_name(name)
      object = self.find_by_name(name)
      object != nil ? object : self.create(name)
    end
  end
end
