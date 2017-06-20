require 'pry'
class Artist

  attr_accessor :name, :song
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all # candidate for module
    @@all
  end

  def self.destroy_all # candidate for module
    @@all.clear
  end

  def save # candidate for module
    @@all << self
  end


    def self.create(name)
      artist = Artist.new(name)
      artist.save
      artist
    end

    def songs
      @songs
    end

    def add_song(song)
      @songs << song unless @songs.include?(song)
      song.artist = self if song.artist != self
      @songs
    end

end
