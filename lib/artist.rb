require_relative './concerns/findable.rb'
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
    created_artist = self.new(name)
    created_artist.save
    created_artist
  end
  
  def add_song(name)
    if name.artist == nil
      name.artist=(self)
    end
    if @songs.include?(name) == false
      @songs << name
    end
  end
  
  def genres
    g = songs.collect do |song|
      song.genre
    end
    g.uniq
    
  end
end