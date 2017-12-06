require 'pry'
class Artist
  attr_accessor :name
  attr_reader :songs, :genres
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

#CLASS METHODS
extend Concerns::Findable

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
 self.new(name).tap {|artist| artist.save}
  end

  #INSTANCE METHODS
  def save
    @@all << self
  end

  def add_song(song)
    song.artist ? self : song.artist = self
    self.songs.include?(song) ? song : @songs << song
  end

  def genres
    self.songs.map {|s| s.genre}.uniq
  end

end
