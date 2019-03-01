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

def self.new_from_filename(filename)
  artist, song, genre = filename.sub('.mp3', '').split(' - ')
  artist = Artist.find_or_create_by_name(artist)
  genre = Genre.find_or_create_by_name(genre)
  new(song, artist, genre)
end

def self.create_from_filename(filename)
     new_song = self.new_from_filename(filename).save
    new_song

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