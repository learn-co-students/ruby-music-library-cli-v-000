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
    @@all << self
  end

  def self.create(name)
    Artist.new(name).tap{|i|i.save}
  end

  def add_song(song)
    if song.artist != self
      song.artist = self
    end
    songs << song unless songs.include?(song)
  end

  def genres
    @songs.collect{|o|o.genre}.uniq
  end

  def to_s
    self.name
  end

end
