module Concerns::Findable 
    
        # Finds a song instance in @@all by the name property of the song
        def find_by_name(name)
            all.detect {|s| s.name == name}
        end

        # Returns (does not recreate) an existing son with the provided name if one exists in @@all
        # Will create one if it doesn't exist
        def find_or_create_by_name(name)
            find_by_name(name)|| create(name)
        end
  
end
