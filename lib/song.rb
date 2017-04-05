require 'pry'

class Song
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    #binding.pry
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

  # #.tap method yields self to the block, and then returns self. The primary purpose of this method is to
  # “tap into” a method chain, in order to perform operations on intermediate results within the chain.

  def self.create(name)
    self.new(name).tap do |song| # taps new instance without conflict with song.name
      song.save  # song == #<Song:0x0000000112bf78 @name="At Your Feet">
      #binding.pry
    end
    #binding.pry
  end
end

#song = Song.create("At Your Feet")
#puts song.name
