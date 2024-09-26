module Concerns

  module Findable

    def find_by_name(name)
      result = nil
      self.all.each do |instance|
        result = instance if instance.name == name
      end
      result
    end

    def find_or_create_by_name(name)
      if self.find_by_name(name) == nil
        self.create(name)
      else
        self.find_by_name(name)
      end
    end

  end

end
