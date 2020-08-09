require "pry"
class Song

@@all = []
attr_accessor :name
 attr_reader :artist, :genre
 
   def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end
  
  # def name=(name)
  #   @name = name
  
  # end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

# def initialize(name)
#   @name = name
#   @@all << self
# end

def self.find_by_name(name)
  @@all.detect {|s| s.name == name}
end

def self.create(name)
  # if @all.detect {|s| s.name != name}
  song = Song.new(name)
  @@all << song
  song
end
    

def self.find_or_create_by_name(name)
  self.find_by_name(name) || self.create(name)
end
  
  
def self.all
  @@all
end

def save
  @@all << self
end

def self.destroy_all
  self.all.clear
end

def self.create(name)
  song = self.new(name)
  song.save
  song
end

 def self.new_from_filename(filename)
  # song_name = self.new(filename)
  # artist_name = Artist.new(filename)
  # genre_name = Genre.new(filename)
  # binding.pry
  # artist_name.name = filename.split(" - ")[0] 
  # song_name.name = filename.split(" - ")[1] 
  # genre_name.name = filename.split(" - ")[2] 
  
    data = filename.split(" - ")
    artist_name, song_name, genre_name = data[0], data[1], data[2].gsub(".mp3", "")
  
  artist = Artist.find_or_create_by_name(artist_name)
  genre = Genre.find_or_create_by_name(genre_name)

    new(song_name, artist, genre)
 end
 
 def self.create_from_filename(filename)
   new_from_filename(filename).tap{ |s| s.save }
  end
end