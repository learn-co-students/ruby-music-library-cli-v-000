require 'pry'
class Artist 
  attr_accessor :name, :genre

  @@all = []
  def initialize(name)
    @name = name
    @songs = []
    @@all << self
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

  def self.create(name)
    song = Artist.new(name)
    song.save
    song
  end

  def songs
    @songs
  end

  def add_song(song)
    #
    #song.artist = self
    #assigns the current artist to the song's 'artist' property (song belongs to artist)

    # song.artist = self unless song.artist
    # does not assign the artist if the song already has an artist

    #syntax for unless => code unless conditional
   song.artist = self unless song.artist

   if !songs.include?(song)
     songs << song
   end
  end

  def genres
    #binding.pry
    songs.collect{|song|song.genre}.uniq
  end



end
