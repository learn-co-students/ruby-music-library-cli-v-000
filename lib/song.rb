class Song

extend Concerns::Findable

attr_accessor :name, :artist, :genre

@@all = []

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
  genre.add_song(self)
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
  song = self.new(name)
  @@all << song
  song
end

def self.find_by_name(name)
    @@all.detect {|a| a.name == name}
  end

def self.find_or_create_by_name(name)
  if self.find_by_name(name)
    self.find_by_name(name)
else
  self.create(name)
end
end

def self.new_from_filename(file)
  updated_file = file.split(" - ")
    song = Song.new(updated_file[1])
    song.artist = Artist.find_or_create_by_name(updated_file[0])
    song.genre = Genre.find_or_create_by_name(updated_file[2].chomp(".mp3"))
    song
end

def self.create_from_filename(file)
  song = Song.new_from_filename(file)
  song.save
end

end
