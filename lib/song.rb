require 'pry'
#require_relative "./artist.rb" # Path to Artist class

class Song
  attr_accessor :name, :artist
  @@all = []

  def initialize(name, artist = nil, genre = nil) # optional artist argument
    @name = name
    if artist != nil # if artist is not nil add artist to song
      self.artist = artist
      #binding.pry
    end
    if genre != nil # if artist is not nil add artist to song
      self.genre = genre
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

  # #.tap method yields self to the block, and then returns self. The primary purpose of this method is to
  # “tap into” a method chain, in order to perform operations on intermediate results within the chain.

  def self.create(name, artist = nil)
    self.new(name, artist).tap do |s| # taps new instance without conflict with song.name
      s.save  # song == #<Song:0x0000000112bf78 @name="At Your Feet">
      #binding.pry
    end
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) # adds the song to the artist's songs
    #binding.pry
  end
end


#casting_crowns = Artist.create("Casting Crowns")
#song = Song.create("Voice of Truth", casting_crowns)
#puts song.name
