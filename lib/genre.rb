class Genre
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
  
  def artists
    artists = []
  @songs.each {|song| artists << song.artist if !artists.include?(song.artist)}
  artists
end
  
end