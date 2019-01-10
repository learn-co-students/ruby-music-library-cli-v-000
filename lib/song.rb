# 1/8/19  MUST UPDATE from artist-song modules lab

require 'pry'

class Song
  # extend Findable::ClassMethods
  # include Paramable::InstanceMethods

  attr_accessor :name
  attr_reader :artist

  def initialize(name)
    @name = name
  end

  def self.create(name)
    Song.new(name).save
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

  def artist=(artist)
    @artist = artist
  end
end
