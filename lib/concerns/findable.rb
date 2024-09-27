module Concerns::Findable 

 def find_by_name(song_name)
    all.detect {|find| find.name == song_name }
  end  

  def find_or_create_by_name(song_name)
    find_by_name(song_name) || self.create(song_name)
    
  end 

end 