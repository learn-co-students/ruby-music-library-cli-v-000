class Song



attr_accessor :name
attr_reader :artist, :genre
@@all =[]

def initialize(name, artist = nil, genre = nil)
@name = name
self.artist = artist if artist
self.genre = genre if genre
end

def artist=(artist)
  @artist= artist
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

def self.create(song_title)
  song = Song.new(song_title)
  song.save
  song
end

def self.find_by_name(name)
  @@all.detect{ |song| song.name == name }
end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

  def self.new_from_filename(file)
    artist, name, genre = file.split(" - ")
    genre = genre.gsub(".mp3", "")

    entry_1 = Artist.find_or_create_by_name(artist)
    entry_2 = Genre.find_or_create_by_name(genre)

    Song.new(name, entry_1, entry_2)

  end

  def self.create_from_filename(file)
    self.new_from_filename(file).save
  end

end
