class Song
    extend Concerns::Findable
  attr_accessor  :name, :artist, :genre
   @@all = []


def initialize(name, artist = nil, genre = nil)
  @name = name
    self.artist=(artist) unless artist == nil
    self.genre=(genre) unless genre == nil
end



def artist=(artist)
  @artist = artist
  artist.add_song(self)
end

def genre=(genre)
  @genre = genre
  genre.songs << self unless genre.songs.include?(self)
end

def self.all
  @@all
end

def self.destroy_all
  all.clear

end

def save
  @@all << self
end

def self.create(name)
  song = new(name)
  song.save
  song
end

def add_artist(artist)
  if artist.song != self
  artist.song = self
end
if !@artists.include?(artist)
  @artists << artist
end
end
def self.find_by_name(song)
      self.all.detect { |s| s.name == song }
  end
  
  def self.find_or_create_by_name(song)
    find_by_name(song) || create(song)
  end
end