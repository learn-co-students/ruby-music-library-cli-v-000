require 'pry'

class Genre
  extend Concerns::Findable # extend is used for Class methods, additionally the Concerns module
  # is included in the config/environment.rb file
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  # #.tap method yields self to the block, and then returns self. The primary purpose of this method is to
  # “tap into” a method chain, in order to perform operations on intermediate results within the chain.

  def self.create(name)
    self.new(name).tap do |genre| # taps new instance without conflict with genre.name
      genre.save  # genre instance is saved to @@all array
      #binding.pry
    end
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

  def artists
    @songs.collect do |song|
      song.artist
      #binding.pry
    end
    .uniq
    # The #artists method iterates over the @songs array and calls the #artist method on each song
    # in order to collect the artist that is associated to that song. The return value of the #artists
    # method should be an array of unique(.uniq) artist objects.
  end

  def to_s
    self.name
  end
end


#christian = Genre.create("christian")
#puts genre.name
