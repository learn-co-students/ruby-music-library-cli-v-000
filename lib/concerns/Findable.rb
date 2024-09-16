module Concerns::Findable

  def find_by_name(name)
     found_song = self.all.detect {|song| song.name == name}
     found_song
  end
  
  def find_or_create_by_name(name)
 
     found_song = self.find_by_name(name)
 
    if found_song
      found_song
    else
      self.create(name)
    end
    
  end
  
  def create(name)
    song = self.new(name)
    self.all << song
    song
  end
 
end