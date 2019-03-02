module Concerns
  module Findable
    def find_by_name(name)
      self.all.detect{|a| a.name == name}
    end
    
    def find_or_create_by_name(name)
      existing = nil 
      existing = find_by_name(name)
      if existing == nil
        self.create(name)
      else 
        return existing
      end
    end 
        
  end 
end 