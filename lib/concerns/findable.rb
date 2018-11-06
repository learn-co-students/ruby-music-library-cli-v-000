module Concerns::Findable

   def find_by_name(song_name)
      self.all.find {|song| song.name == song_name}
         song_name
   end
      
   def find_or_create_by_name(song_name)
     if new_song = self.find_by_name(song_name)
         new_song
        
       else
        self.create(song_name)
       end 
   end
 end
