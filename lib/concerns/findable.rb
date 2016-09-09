module Concerns
    module Findable
        
        def create(name)
            thing = self.new(name)
            thing.save
            thing
        end 
        
        def find_by_name(name)
            self.all.detect {|thing| thing.name == name}
        end
        
        def find_or_create_by_name(name)
            if !self.find_by_name(name)
                self.create(name)
            else
                self.find_by_name(name)
            end
        end
    end
end