class Artist
  extend Concerns::Findable
  extend Concerns::ClassMethods
  include Concerns::InstanceMethods
  attr_accessor :name
  @@all = []
  def initialize(name)
    @name = name 
    @songs = []
  end
  
  def self.all 
    @@all 
  end 
  
  def add_song(song)
    @songs << song if !@songs.include?(song)
    song.artist = self if song.artist == nil
  end
  
  def genres
    genres = []
  @songs.each {|song| genres << song.genre if !genres.include?(song.genre)}
  genres
  end
  
end