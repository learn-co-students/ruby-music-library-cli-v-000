module Concerns::Findable
  
  module ClassMethods
    def find_by_name(song_name)
    self.all.find {|song| song.name == song_name}
    end
    
    def find_or_create_by_name(song_name)
     if song = self.find_by_name(song_name)
       song
       
      else
        self.create(song_name)
      end
    end
    
  
  end
end