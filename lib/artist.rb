require 'pry'
class Artist
  
  attr_accessor :name, :songs, :genres
  
  @@all = []
  
  def initialize(name)
    @name= name
    @songs = []
    # @genres = []
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
  
  def self.create(art_name)
    art_name = Artist.new(art_name)
    art_name.save
    art_name
  end
  
  def add_song(song)
    if song.artist == nil
      song.artist = self
      @songs << song
    end
  end
  
  def genres
    # @genres = @songs.collect {|song| song.genre}
  end
  
end
