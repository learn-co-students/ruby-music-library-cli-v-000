class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    self.name = name
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

  def self.create(name)
    new_song = self.new(name)
    new_song.save
    new_song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.find_by_name(name)
    @@all.detect{|a| a.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename)
    file = filename.split(" - ")
    artists, song, genres = file[0], file[1], file[2].gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(artists)
    genre = Genre.find_or_create_by_name(genres)
    new(song, artist, genre)
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).tap{ |a| a.save }
  end

end
