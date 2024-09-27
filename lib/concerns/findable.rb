module Concerns

  module Findable
    
    def find_by_name(name)
      self.all.detect{|finding| finding.name == name}
    end

    def find_or_create_by_name(name)
      self.find_by_name(name) || self.new(name)      
    end
    
  end

end


