require 'pry'

class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    @artist = artist
    @genre = genre
  end

  def name
    @name
  end

  def self.all
    @@all
  end

  def save
    @@all << self
    self
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    song = self.new(name).save
    song
  end

  def artist
    #binding.pry
    @artist
  end

  def artist=(name)
    if self.artist.nil?
      @artist = name
    end
    self.artist.add_song(self)
    #binding.pry
  end

  def self.find_by_name(name)

  end

  def self.find_or_create_by_name(name)

  end

end
