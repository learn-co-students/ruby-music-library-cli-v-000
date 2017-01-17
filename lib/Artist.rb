require 'pry'

class Artist
  include Memorable::InstanceMethods
  extend Memorable::ClassMethods

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def add_song(song)
    @songs << song
  end
  # binding.pry

end
