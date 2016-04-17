require_relative '../concerns/findable.rb'

class Artist
  extend Concerns::Findable
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
    @@all << self
  end
  def self.create(artist)
    new_artist = Artist.new(artist)
    new_artist.save
    new_artist
  end
  def add_song(song)
    song.artist = self unless song.artist == self
    if !@songs.include?(song)
      @songs << song
    end
  end
  def genres
    @songs.collect do |song|
      song.genre
    end.uniq
  end

end
