module Concerns::Findable
 
      def find_by_name(name)
        self.all.find {|a| a.name == name}
      end
      
   def find_or_create_by_name(song)
     if find_by_name(song)
      find_by_name(song)
    else 
      create(song)
    end
  end
  
end  