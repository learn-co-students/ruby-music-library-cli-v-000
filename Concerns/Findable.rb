module Concerns::Findable
     
     def find_by_name (name_of_object)
        self.all.each do |object|
        if name_of_object==object.name
        return object
        end
                    end
     end
    
    def find_or_create_by_name(name_of_object)
        self.all.each do |object|
        if name_of_object==object.name
            return object 
        end
                    end
        self.create(name_of_object)
    end
end