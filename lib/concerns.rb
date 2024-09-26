module Concerns
  module Findable

    def find_by_name(item)
      self.all.each do |thing| 
        return thing if thing.name == item
      end
      nil
    end

    def find_or_create_by_name(name)
      result = self.find_by_name(name)
      if result == nil
        result = self.create(name)
      end
      result
    end

  end

end
