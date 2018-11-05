module Concerns::Findable

    def find_by_name(song_name)
      self.all.find {|song| song.name == song_name}
       self
    end
    
    def find_or_create_by_name(song_name)
       if song = self.find_by_name(song_name)
         song
        
       elsif song = nil
        self.create(song_name)
        
      
        
  
    end
  end
    
  
end
# well in the if statement, you actually want to be checking the find_by_name(song_name) directly as opposed to storing it as a variable

# Antonio Reid A FEW SECONDS AGO
# and if it returns nil, then create a song, otherwise just find by name