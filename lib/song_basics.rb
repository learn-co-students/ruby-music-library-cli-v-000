require 'pry'

class Song
  attr_accessor :name, :artist

  @@songs = []

  def initialize(name)
    @name = name
  end

  def self.all
    @@songs
  end

  def self.destroy_all
    all.clear
  end

  def save
    # self.class.all << self
    Song.all << self
  end

  def self.create(name)
    song = self.new(name)
    song.save
    # binding.pry
  end
end
