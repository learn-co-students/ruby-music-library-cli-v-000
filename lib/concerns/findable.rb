module Concerns::Findable
      
      def find_by_name(name) 
        all.find {|item| item.name == name}
      end 
  
      def find_or_create_by_name(name) 
        if find_by_name(name) != nil
          item = find_by_name(name) 
        else
          item = create(name) 
        end
        item
      end 
      
end 
    