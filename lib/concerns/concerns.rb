module Concerns::Findable
    
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

module Concerns::Listables
    
    def numbered_list
    list = self.all.sort_by { |object| object.name }
        list.each_with_index do |object, i|
            puts "#{i+1}. #{object.name}"
        end
    end

end
