require 'pry'

class Song
  include Memorable::InstanceMethods
  extend Memorable::ClassMethods

  attr_accessor :name
  attr_reader :artist
  @@all = []

  def initialize(name, artist = nil)
    @name = name
    # self.artist = artist
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  # binding.pry

  def self.all
    @@all
  end
end
