require 'pry'
class Artist
  extend Concerns::Findable
  attr_accessor :name, :song, :genre
  @@all = []
  def initialize(name)
    @name = name
    @@all << self
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    Artist.new(name)
  end

  def songs
    @songs
  end

  def add_song(song)
     song.artist = self unless song.artist
     songs << song unless songs.include?(song)
   end

   def genres
     songs.map{|x| x.genre}.uniq
   end
end
