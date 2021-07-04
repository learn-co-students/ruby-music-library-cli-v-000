require_relative './concerns/findable.rb'

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
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    created_artist = Artist.new(name)
    created_artist.save
    created_artist
  end

  def add_song(song)
    self.songs.include?(song) ? nil : self.songs << song
    song.artist ||= self
  end

  def genres
    self.songs.collect do |each_song|
      each_song.genre
    end.uniq
    #can also assign to a variable and chain off of it
  end

end
