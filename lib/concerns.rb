module Concerns
  
  module Findable
    
    def destroy_all
      self.all.clear
    end
    
    def find_by_name(name)
      self.all.detect{|item| item.name == name}
    end
    
    def find_or_create_by_name(name)
      if self.find_by_name(name)#all.any?{|item| item.name == name}
        item = self.find_by_name(name)
      else
        item = self.create(name)
      end
      item
    end
    
    def create(name, attr1 = nil, attr2 = nil)
      if self.class == Song
        new = self.new(name, attr1, attr2)
      else
        new = self.new(name)
      end
      new.save
      new
    end
    
  end
  
  module Instance
    
    def save
      self.class.all << self
    end
    
    def initialize(name, attr1 = nil, attr2 = nil)
      @name = name
    end
  
  end
  
  module MLInit
    def initialize(path)
      @path = path
    end
  end
end