require 'pry'

class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs#, :artist, :genre
  @@all = []

  def initialize(name)#, artist=nil, genre=nil)
    @name = name
    @songs = []
=begin
    if genre != nil
      @genre = genre
    end
    if artist != nil
      @artist = artist
    end
=end
  end

  def artists
    arr = []
    self.songs.each do |x|
      arr << x.artist
    end
    arr.uniq
  end

  def songs
    @songs
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
    genre = self.new(name)
    genre.save
    genre
  end
end
