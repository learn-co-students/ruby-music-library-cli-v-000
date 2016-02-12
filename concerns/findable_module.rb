module Findable
  
  module InstanceMethods
    
    def save
      self.class.all << self
    end
  end

  module ClassMethods

    def create(name)
      self.new(name)
    end

    def destroy_all
      self.all.clear
    end

    def list_by_name
      counter = 1
      stuff = []
      self.all.each do |i| 
        stuff << "#{counter} - #{i.name} "
        counter += 1
        end 
        stuff
    end
    


  end
end