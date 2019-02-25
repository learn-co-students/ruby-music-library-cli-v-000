class Song

  attr_accessor  :name, :artist, :genre
   @@all = []
 extend Concerns::Findable

def initialize(name, artist = nil, genre = nil)
  @name = name
   self.artist = artist if artist
    self.genre = genre if genre
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


 def self.find_by_name(name)
    self.all.detect {|song| song.name.eql?(name)}
  end
  

  def self.find_or_create_by_name(name)
   find_by_name(name) || create(name)
  end 
  
def self.create(name)
  song = new(name)
  song.save
  song
end
#Working in progress #
def self.new_from_filename(name)
  artist, song, genre = name.split(' - ')
  self.artist = Artist.find_or_create_by_name(artist)
  self.genre = Genre.find_or_create_by_name(genre)
  song = Song.find_or_create_by_name(song)
  
end
def add_artist(artist)
  if artist.song != self
  artist.song = self
end
if !@artists.include?(artist)
  @artists << artist
end
end
  
end