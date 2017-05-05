module Concerns


#-------------------------------------------------------
module Findable
    #explicit self still refers to class here

    def find_by_name(name)
        found = nil
        self.all.each{|each_one|
                                if each_one.name == name
                                    found = each_one       
                                end
                        }
        found
    end


    def find_or_create_by_name(name)
        found = nil
        if find_by_name(name)
           found = find_by_name(name)
        else
            found = self.create(name)
        end
        found
    end





#---
end #end of module definition
end
