module Concerns
    module Findable
    
        def find_by_name(name)
            all.find {|s| s.name == name}
        end

        def find_or_create_by_name(name)
            s = find_by_name(name)
            if s
                s
            else
                create(name)
            end
        end
    end
    
    module Listables
    
    def numbered_list
    list = self.all.sort_by { |object| object.name }
        list.each_with_index do |object, i|
            puts "#{i+1}. #{object.name}"
        end
    end

    end
end

module Persistable
    module ClassMethods
        def destroy_all
            self.all.clear  
        end 
        
        def self.extended(base)
           base.class_variable_set(:@@all, []) 
        end
    end
    
    module InstanceMethods
        def save
            self.class.all << self
        end
    
    end
end

