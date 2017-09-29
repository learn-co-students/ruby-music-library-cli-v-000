module Concerns
  
  module Findable
    def find_by_name(name)
      self.all.detect {|instance| instance.name == name} 
    end

    def create_by_name(name)
      self.create(name)
    end

    def find_or_create_by_name(name)
      self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
    end
  
  end

end