module Concerns

  module Findable

    def find_by_name(name)
      found = nil
      self.all.each do |thing|
        if thing.name == name
          found = thing
        end
      end
      found
    end

    def find_or_create_by_name(name)
      search_result = self.find_by_name(name)
      if search_result == nil
        create(name)
      else
        search_result
      end
    end

  end

end
