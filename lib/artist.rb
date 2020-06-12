
#genre = waiter
#song = meal
#artist = customer

require "pry"
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
    @@all = []
  end

  def save 
    @@all << self
  end
  
  def self.create(name)
    new_artist = Artist.new(name)
    new_artist.save 
    new_artist
  end

  def add_song(song)
    if song.artist != self && !songs.include?(song)
      song.artist = self
      @songs << song
    end
  end

  def genres #returns an array of genre objects
		self.songs.collect do |song|
			song.genre 
		end.uniq
	end
end 
