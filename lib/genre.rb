require 'pry'

class Genre
  attr_accessor :name, :songs
  extend Concerns::Findable
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    self.save
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
    if song.genre == nil
      song.genre = self
    end
    if @songs.include?(song) == false
      self.songs << song
    end
  end

  def artists
    self.songs.map{|a| a.artist}.uniq
  end


  def self.create(song)
    # binding.pry
     song = self.new(song)
     song.save
     song
  end
end
