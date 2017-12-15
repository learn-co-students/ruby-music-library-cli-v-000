# require_relative './artist.rb'

class Song
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
    self.save
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
    song = Song.new(name)
  end

  def self.new_from_filename(filename)
    arr = filename.gsub(".mp3", "").split(" - ")
    song_name = arr[1]
    artist = Artist.find_or_create_by_name(arr[0])
    genre = Genre.find_or_create_by_name(arr[2])
    Song.new(song_name, artist, genre) unless self.find_by_name(song_name)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end

  # def self.find_by_name(name)
  #   @@all.detect {|song| song.name == name}
  # end
  #
  # def self.find_or_create_by_name(name)
  #   self.find_by_name(name) || self.create(name)
  # end

end
