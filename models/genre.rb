require_relative "../concerns/findable.rb"
require_relative "../models/artist.rb"
require_relative "../models/song.rb"
class Genre
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs

  @@all

  #Accepts Name for a new Genre
  def initialize(name)
    @name = name
    @songs = []
  end

  #Returns the class variable @@all
  def self.all
    @@all
  end

  #Resets the class variable
  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  #Will initialize a new Artist and save that Artist to the class array
  def self.create(name)
    genre = self.new(name)
    genre.save
    return genre
  end

  def artists
    @songs.collect{|s| s.artist}.uniq
  end

end
