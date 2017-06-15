class Song
extend Concerns::Findable

attr_accessor :name, :artist, :genre

@@all = []

def initialize(name, artist = nil, genre = nil)
  @name = name
  self.artist = artist if artist
  self.genre = genre if genre
end

def self.all
  @@all
end

def save
@@all << self
end

def self.destroy_all
@@all.clear
end

def self.create(name, artist = nil, genre = nil)
  song = self.new(name, artist, genre)
  song.save
  song
end

def artist=(artist)
@artist = artist
artist.add_song(self)
end

def genre=(genre)
  @genre = genre
  genre.add_song(self)
end

def self.new_from_filename(filename)
  file = filename.split(" - ")
  artist = Artist.find_or_create_by_name(file[0])
  genre = Genre.find_or_create_by_name(file[2].gsub(".mp3", ""))
    song = Song.new(file[1], artist, genre)
    song
end

def self.create_from_filename(filename)
  song = self.new_from_filename(filename)
  song.save
  song
end

end
