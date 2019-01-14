require 'pry'

class Artist
  attr_accessor :name, :songs
#  extend Findable::ClassMethods
  @@all = []
  #@@genres = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    Artist.new(name).save
    self
  end

# @@all array: methods to save, read & delete list of all Song objects
  @@all = []

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
    @songs << song if !@songs.include?(song)
    song.artist = self if !song.artist
  end

  def genres
    genres = []
    self.songs.each do |song|
      genres << song.genre  #  if genres.include?(!song.genre)
    end
    binding.pry
    genres
  end

#  def add_songs(songs)
#    songs.each { |song| add_song(song) }
#  end

end # Artist class end
