require 'pry'

class Genre
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
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
    self.new(name).tap do |genre| # taps new instance without conflict with genre.name
      genre.save  # genre == #<Genre:0x0000000112bf78 @name="christian">
      #binding.pry
    end
  end

  def add_song(song)
    song.genre = self unless song.genre == self
    # Tells a song that it belongs to genre. This should happen when that song is added to
    # the genre's @songs collection, unless song already has a genre.
    if @songs.include?(song) == false
      @songs << song
    end
    # Add song to genre's @songs collection, unless song is already in genre's collection
    #binding.pry
  end
end


#genre = Genre.create("christian")
#puts genre.name
