require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    song = self.new(name)
    song.save
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.all.find(-> {self.new(name).save}) {|song| song.name == name}
  end

  def self.new_from_filename(file)
    artist = Artist.find_or_create_by_name(file.split(" - ")[0])
    genre = Genre.find_or_create_by_name(file.split(" - ")[2].gsub(".mp3", ""))
    self.new(file.split(" - ")[1], artist, genre)
  end

  def self.create_from_filename(file)
    artist = Artist.create(file.split(" - ")[0])
    genre = Genre.create(file.split(" - ")[2].gsub(".mp3", ""))
    self.new(file.split(" - ")[1], artist, genre).save
  end

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist=(artist) if artist
    self.genre=(genre) if genre
  end

  def save
    @@all << self
    self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self) unless genre.songs.include?(self)
  end

end

