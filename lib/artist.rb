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
    Artist.new(name).tap {|a| a.save}
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self if song.artist.to_s == ''
  end

  def genres
   self.songs.collect{|s| s.genre}.uniq
  end

end
