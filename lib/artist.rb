require 'pry'
class Artist
  attr_accessor :name
  attr_reader :songs, :genre
  @@all = []
  extend Concerns::Findable

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    new(name).tap{|artist| artist.save}
  end

  def add_song(song)
    if song.artist.nil? then song.artist = self
    end
    unless self.songs.include?(song) then @songs << song
    end
  end

  def genres
    self.songs.map {|song| song.genre}.uniq
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end
end
