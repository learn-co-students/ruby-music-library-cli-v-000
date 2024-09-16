require 'pry'

class Artist
  extend Concerns::Findable
  
  attr_reader :songs
  attr_accessor :name

  @@all = []

  def initialize(name)
    self.name = name
    @songs = []
  end

  def self.create(name)
    new_instance = self.new(name)
    new_instance.save
    new_instance
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def add_song(song)
    song.artist = self unless song.artist
    self.songs << song unless self.songs.include?(song)
  end

  def genres
    self.songs.collect {|song|song.genre}.uniq
  end
end
