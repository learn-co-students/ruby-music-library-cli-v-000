module Persistable 
    module InstanceMethods

        def save
            self.class.all << self
        end
    end

    module ClassMethods 

        def create(name)
            item = self.new(name).tap {|i| i.save}
        end
        
        def destroy_all
            self.all.clear
        end

        def count
            self.all.size
        end

        def self.extended(base)
            base.class_variable_set(:@@all, [])
        end
      
        def all
            self.class_variable_get(:@@all)
        end
        
    end
end
