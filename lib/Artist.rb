require 'pry'
class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []


  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @songs = []
    save
  end

   def add_song(song)
    @songs << song.artist unless song == song
    song.artist = self unless songs.include?(song)
  end


  def self.destroy_all
    @@all.clear
  end

  def genres
   @songs.collect{|s| s.genre}.uniq
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = self.new(name)
  end

end

