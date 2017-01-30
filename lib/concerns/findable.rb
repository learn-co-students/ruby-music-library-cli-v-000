module Concerns::Findable
    
    def self.find_by_name(name)
      self.all.find {|obj| obj.name == name}
    end# of self.find_by_name

end