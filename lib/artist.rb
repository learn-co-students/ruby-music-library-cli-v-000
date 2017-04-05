require 'pry'

class Artist
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.songs
    @songs
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    # Tells a song that it belongs to an artist. This should happen when that song is added to
    # the artist's @songs collection, unless the song.artist is already equal to self.
    @songs << song unless @songs.include?(song)
    # Add song to artist's @songs collection, unless song is already in collection    
  end

  #def add_song_by_name(name, genre)
  #  song = Song.new(name, genre)
  #  @songs << song
  #  song.artist = self
  #end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

  def self.find_or_create_by_name(name) # this method is called from Song class
    self.find(name) || self.create(name)
  end

  def self.find(name)
    self.all.find do |artist| # searches for artist name in @@all array
      artist.name == name
    end
  end

  # #.tap method yields self to the block, and then returns self. The primary purpose of this method is to
  # “tap into” a method chain, in order to perform operations on intermediate results within the chain.

  def self.create(name)
    self.new(name).tap do |artist| # taps into new Artist instance without conflict with artist.name
      artist.save  # artist == #<Artist:0x0000000112bf78 @name="Rich Mullins">
      #binding.pry
    end
  end
end

#artist = Artist.create("Rich Mullins")
#puts artist.name
