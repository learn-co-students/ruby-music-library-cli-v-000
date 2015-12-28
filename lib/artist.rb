require_relative '../concerns/findable.rb'

class Artist 
  extend Concerns::Findable

  attr_accessor :name, :songs
 
  @@all=[]

  def initialize(name)
    @name=name
    @songs=[]
  end

  def self.all 
    @@all
  end

  def self.destroy_all  
    self.all.clear
  end

  def save 
    @@all<<self
  end

  def self.create(name)
    new_artist=self.new(name)
    new_artist.save  
    new_artist
  end

  def add_song(song)
    @songs<< song if !songs.include?(song)
    song.artist=self if song.artist !=self
  end

  def genres
    songs.collect do |song|
      song.genre
    end.uniq
  end

end 