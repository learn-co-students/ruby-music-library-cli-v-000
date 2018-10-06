module Concerns
  module Findable
    def find_by_name(name)
      self.all.detect{|a| a.name == name}
    end
  
    def find_or_create_by_name(search)
      results = self.find_by_name(search)
      if results == nil
        results = self.create(search)
      end
      results
    end
  end
end