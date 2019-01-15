require 'pry'

class Artist
  attr_accessor :name, :songs
  attr_reader :genres
  @@all = []


  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    Artist.new(name).save
    self
  end

# @@all array: methods to save, read & delete list of all Song objects
  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end
# end @@all methods

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist
  end

  def genres
    genres = []
    @songs.each do |song|
      genres << song.genre unless genres.include?(song.genre)
    binding.pry
    end
    genres
  end

end # Artist class end
