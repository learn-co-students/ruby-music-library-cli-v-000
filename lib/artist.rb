require 'pry'
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
    self.all << self
  end

  def self.create(name)
    artists = Artist.new(name)
    artists.save
    artists
  end


  def add_song(song)
    @songs << song unless @songs.include? song
    song.artist = self unless song.artist == self
  end

  def genres
    self.songs.collect {|s| s.genre}.uniq
  end
end
