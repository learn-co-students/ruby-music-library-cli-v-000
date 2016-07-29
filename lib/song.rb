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

  def Song.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def Song.find_or_create_by_name(name)
    self.all.find(-> {self.new(name).save}) {|song| song.name == name}
  end

  def Song.new_from_filename(file)
    song = self.new(file.split(" - ")[1])
    song.artist = Artist.find_or_create_by_name(file.split(" - ")[0])
    song.genre = Genre.find_or_create_by_name(file.split(" - ")[2].gsub(".mp3", ""))
    song
  end

  def Song.create_from_filename(file)
    song = self.new(file.split(" - ")[1])
    song.artist = Artist.find_or_create_by_name(file.split(" - ")[0])
    song.genre = Genre.find_or_create_by_name(file.split(" - ")[2].gsub(".mp3", ""))
    song.save
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

