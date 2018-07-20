class Artist 
  attr_accessor :name
  attr_reader :songs
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.create(name)
    self.new(name).save
  end
  
  def add_song(song_name)
    new_song = Song.new(song_name, options ={})
    new_song.save
    @songs << new_song
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