module Persistable
 
    module InstanceMethods
     def save
        self.class.all << self
      end


    end    

    module ClassMethods
        
        def self.create(name)
          new_created = self.new(name)
          new_created.save
          new_created
        end



        def self.destroy_all
            self.all.clear
        end


    end
end