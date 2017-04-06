require 'pry'
#require_relative "./song.rb" # Path to Song class.

class Artist
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  # #.tap method yields self to the block, and then returns self. The primary purpose of this method is to
  # “tap into” a method chain, in order to perform operations on intermediate results within the chain.

  def self.create(name)
    self.new(name).tap do |artist| # taps into new Artist instance without conflict with artist.name
      artist.save  # add artist instance (#<Artist:0x0000000112bf78 @name="Rich Mullins">) to @@all array
      #binding.pry
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    # Tells a song that it belongs to an artist. This should happen when that song is added to
    # the artist's @songs collection, unless song already has the artist.
    if @songs.include?(song) == false
      @songs << song
    end
    # Add song to artist's @songs collection if song is not already in artist's collection
    #binding.pry
  end

  def self.songs
    @songs
  end

  def genres
    self.songs.collect do |song|
      song.genre
    end
    .uniq
    # The #genres method iterates over the @songs array, stored in the #songs instance method, and
    # calls the #genre method on each song in order to collect the genre that is associated to that
    # song. The return value of the #genres method should be an array of unique(uniq) genre objects.
  end

  def save
    self.class.all << self
  end

  def to_s
    self.name
  end

  #def self.find_or_create_by_name(name) # this method is called from Song class
  #  self.find(name) || self.create(name)
  #end

  #def self.find(name)
  #  self.all.find do |artist| # searches for artist name in @@all array
  #    artist.name == name
  #  end
  #end

  #def add_song_by_name(name, genre)
  #  song = Song.new(name, genre)
  #  @songs << song
  #  song.artist = self
  #end
end

#casting_crowns = Artist.create("Casting Crowns")
#puts casting_crowns.name.inspect
#puts casting_crowns.to_s.inspect
