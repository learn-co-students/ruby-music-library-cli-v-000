module
Concerns::Findable
def self.find_by_name(name)
    self.all.detect {|object| object.name == name}
  end
    
  def self.find_or_create_by_name(song_name)
  if self.find_by_name(song_name) 
    @@all.detect {|song| song.name == song_name}
  else 
    self.create(song_name)
  end
end
end