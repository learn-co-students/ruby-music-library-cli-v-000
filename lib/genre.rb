class Genre 
  attr_accessor :name, :artist, :songs 
  attr_reader :genre
  
  extend Concerns::Findable
  extend AllForAll::ClassMethods
  include AllForAll::InstanceMethods
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all 
    @@all
  end
  
  def artist 
    genre.artist = self
  end
  
  def artists 
    @songs.collect {|song| song.artist}.uniq
  end
  
end