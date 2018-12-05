class Song
attr_accessor :name
attr_reader :artist, :genre

@@all = []

def initialize(name, artist = nil, genre = nil)
  @name = name
  self.artist = artist if artist
  self.genre = genre if genre
end

def genre
  @genre
end

def genre=(genre)
  @genre = genre
  new_genre = genre.songs
  new_genre << self if !genre.songs.include?(self)
end

def artist=(artist)
  @artist = artist
  artist.add_song(self)
end

def self.all
  @@all
end

def self.destroy_all
  @@all.clear
end

def save
  @@all << self
end

def self.create(name)
  created_song = Song.new(name)
  created_song.save
  created_song
end


end
