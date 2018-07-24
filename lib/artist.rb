# require_relative 'song'

class Artist 
  extend Concerns::Findable
  
  attr_accessor :name
  attr_reader :songs
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.create(name)
    new_artist = self.new(name)
    new_artist.save 
    new_artist
  end
  
  def add_song(song)
    if song.artist == nil
      song.artist = self
    end
    
    unless @songs.include?(song)
      @songs << song
    end
  end
  
  def genres
    genres = []
    @songs.each {|song| genres << song.genre unless genres.include?(song.genre)}
    genres
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
end

# a = Artist.create("U2")
# b = Artist.create('steen')
# p Artist.find_by_name("U2")
# p Artist.find_by_name("Steen")
# p Artist.find_or_create_by_name("Jewel")
# puts a.songs[0].artist
# puts Artist.all.inspect