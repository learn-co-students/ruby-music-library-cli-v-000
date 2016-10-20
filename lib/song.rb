require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    self.name = name
    artist != nil ? self.artist = artist : nil
    genre != nil ? self.genre = genre : nil
  end

  def self.new_from_filename(filename)
    new_song = Song.new(filename.split(" - ")[1]) #Creates a new Song instance with name
    new_song.artist= Artist.find_or_create_by_name(filename.split(" - ")[0]) #Adds artist object to the song
    new_song.genre= Genre.find_or_create_by_name(filename.split(" - ")[2].chomp(".mp3")) #Adds genre object to the song
    new_song
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    #binding.pry
    self.all << new_song
    new_song
  end

  def artist=(artist)
    @artist = artist
    artist.songs.include?(self) ? nil : artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs.include?(self) ? nil : genre.songs << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    song = self.new(name)
    song.save
    #self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name) #Finds or creates the instance if it doesnt exist
    self.find_by_name(name) || self.create(name)
  end
end
