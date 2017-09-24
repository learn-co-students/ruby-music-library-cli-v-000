require_relative './concerns/findable.rb'
class Artist
  extend Concerns::Findable

  @@artists = []
  
  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@artists
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def save
    @@artists << self
  end

  def self.destroy_all
    self.all.clear
  end

  def add_song(song)
    if @songs.include?(song) == false
      @songs << song
      song.artist = self 
    end
  end

  def genres
    @songs.map{|song| song.genre}.uniq
  end

end