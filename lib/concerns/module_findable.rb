module Concerns::Findable

def find_by_name(song_name)
  self.all.detect do |song_instance|
    song_instance.name == song_name
  end
end

def find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
    self.find_by_name(song_name)
  else
    self.create(song_name)
  end
end

end
