require_relative '../concerns/findable.rb'
require_relative '../concerns/print.rb'

class Genre
  extend Concerns::Findable

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(songname)
    song = self.new(songname)
    song.save
    song
  end

end
