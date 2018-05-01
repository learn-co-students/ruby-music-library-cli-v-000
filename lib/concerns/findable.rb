module Concerns::Findable
    
    def find_by_name(name)
      self.all.detect{|s| s.name == name}
    end
    
    def find_or_create_by_name(name)
      self.find_by_name(name) || self.create(name)
    end
  
    def sorted
      self.all.uniq.sort_by {|s| s.name}
    end
end