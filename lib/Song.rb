class Song
attr_accessor :name, :artist
@@all = []
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist #wait why did this work?
    self.genre = genre if genre
    #and this didn't at first
  end

  def genre
    @genre
  end

def genre=(genre)
  @genre = genre
  if !genre.songs.include?(self)
    genre.songs << self
  end
end

def artist=(artist)
  @artist = artist
  artist.add_song(self)
end

def self.all
  @@all
end

def self.destroy_all
  @@all = []
end

def save
  @@all << self
end

def self.create(name)
  song = Song.new(name)
  @@all << song
  song
end

def self.find_by_name(name)
found = nil
@@all.each {|song|
    if song.name.include?(name)
      found = song
    end}
found
end

def self.find_or_create_by_name(name)
self.find_by_name(name) || self.create(name)
end

def self.new_from_filename(file_name)
    song_parts = file_name.split(" - ")
    song_name = song_parts[1].chomp
    song_artist = song_parts[0].chomp(" ")
    song_genre = song_parts[2].chomp(".mp3")
    artist = Artist.find_or_create_by_name(song_artist)
    genre = Genre.find_or_create_by_name(song_genre)
    song = Song.new(song_name, artist, genre)
    song
  end
  def self.create_from_filename(file_name)
    song = new_from_filename(file_name)
    @@all << song
    end

end
