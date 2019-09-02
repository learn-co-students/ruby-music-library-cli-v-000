#adapted for general reuse to mix into artist & genre
module Concerns::Findable
    
    def find_by_name(name)
        self.all.detect {|song| song.name == name}
    end
    
    def find_or_create_by_name(name)
        if !self.find_by_name(name)
            self.create(name)
        else
            self.find_by_name(name)
        end
    end
end



#CONCERNS::FINDABLE
#Implement a generic #find_by_name method that uses the .all method defined by the class to find an instance of the class by name.
#Implement a generic #find_or_create_by_name method that uses the .all method defined by the class to find an instance of the class by name and to create a new instance if a match is not found.
