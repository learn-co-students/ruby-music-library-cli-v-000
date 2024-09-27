class Genre 

 extend Concerns::Findable
 extend Memorable::ClassMethods 
 include Memorable::InstanceMethods

  attr_accessor :name, :songs
  @@all =[]
  
   def self.create(name)
    g = self.new(name) 
    g.save
    g
  end
  
  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end
  
  def add_song(song)
    @songs << song 
    song.genre = self
  end
  
  def songs 
    @songs 
  end
  
  def artists 
    @songs.collect{|song| song.artist}.uniq
  end
 end
