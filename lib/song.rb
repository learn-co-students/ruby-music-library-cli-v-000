require_relative '../config/environment'

class Song
  extend Concerns::Findable
  attr_accessor :name
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist
    self.genre = genre
  end

  def artist
    @artist
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist == nil
  end

  def genre
    @genre
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self) unless genre == nil
  end

  def self.all
    @@all.sort_by{|i| i.name}
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    new = self.new(name)
    new.save
    new
  end

  def self.new_from_filename(file_name)
    file = file_name.split(" - ")
    artist_name = file[0]
    song_name = file[1]
    genre_name = file[2].chop.chop.chop.chop
    artist = Artist
    song = Song.find_or_create_by_name(song_name)
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    song.artist = artist
    song.genre = genre
    song
  end

  def self.create_from_filename(file_name)
    self.new_from_filename(file_name)
  end

end

class Artist
  extend Concerns::Findable
  attr_accessor :name, :song
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
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
    new = self.new(name)
    new.save
    new
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist == self
  end

  def genres
    @songs.collect{|s| s.genre}.uniq

  end

end

class Genre
  extend Concerns::Findable
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def artists
    @songs.collect{|s| s.artist}.uniq
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
    new = self.new(name)
    new.save
    new
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.genre = self unless song.genre == self
  end

end
