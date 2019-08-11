require 'pry'

class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist #if artist
    self.genre = genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
    self
  end

  # def self.create(name)
  #   new_song = Song.new(name)
  #   new_song.name = name
  #   new_song
  # end

  def artist=(artist)
    @artist = artist
    if artist != nil
      @artist.add_song(self)
    end
  end

  def genre=(genre)
    @genre = genre
    if @genre != nil && @genre.songs.include?(self) == false
      @genre.songs << self
    end
  end

  # def self.find_by_name(name)
  #   @@all.detect {|s| s.name == name}
  # end

  # def self.find_or_create_by_name(name)
  #   # if self.find_by_name(name)
  #   #   result = self.find_by_name(name)
  #   # else
  #   #   result = self.create(name)
  #   # end
  #   # result
  #
  #   self.find_by_name(name) || self.create(name)
  #
  #   # IF I cannot find the name of the song, create the song. ELSE return the song.
  #
  #   # If you find the song, return the found song
  #   # If you cant find the song, create the song
  # end

  def self.new_from_filename(path)
    genre = path.split(" - ")[2].gsub(".mp3", "")
    name = path.split(" - ")[1]
    artist = path.split(" - ")[0]
    song = Song.new(name)
    song.artist = Artist.find_or_create_by_name(artist)
    song.genre = Genre.find_or_create_by_name(genre)
    song
  end

  def self.create_from_filename(path)
    song = self.new_from_filename(path)
    song.save
  end


end
