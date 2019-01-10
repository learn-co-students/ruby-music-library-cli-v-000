# 1/8/19  MUST UPDATE from artist-song modules lab
require 'pry'

class Artist
  attr_accessor :name
  attr_reader :songs
#  extend Findable::ClassMethods
  @@all = []

  def initialize(name)
    @name = name
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

#  def add_song(song)
#    @songs << song
#    song.artist = self
#  end
#
#  def add_songs(songs)
#    songs.each { |song| add_song(song) }
#  end

end # Artist class end
