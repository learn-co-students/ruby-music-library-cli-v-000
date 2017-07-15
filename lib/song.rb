require 'pry'
class Song
  extend Concerns::Findable
  attr_accessor :name, :genre, :artist
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist= (artist) if artist != nil
    self.genre= (genre) if genre != nil
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all  << self
  end

  def self.create(name)
    song = new(name)
    song.save
    song
  end

  def artist
    @artist
  end

  def artist=(artist_name)
    artist_name.add_song(self) unless artist_name.songs.include?(self)
    @artist = artist_name
  end

  def genre=(genre)
    genre.songs << self unless genre.songs.include?(self)
    @genre = genre
  end

  def self.new_from_filename(file_name)
    file_array = file_name.chomp('.mp3').split(" - ")
    song = self.new(file_array[1],Artist.find_or_create_by_name(file_array[0]),Genre.find_or_create_by_name(file_array[2]))
  end

  def self.create_from_filename(file_name)
     song = self.new_from_filename(file_name).save
     song
  end


end