class Artist
  extend Concerns::Findable 
  @@all = []
  attr_accessor :name, :songs
  
  def initialize(name)
    @name =name 
    @songs =[]
    save
  
  end
  
  def self.all
    @@all
  end 
  
  def self.destroy_all
    @@all= [] 
  end 
  
  def save 
    @@all << self
  end
  
  def self.create(name)
   new(name).tap{|a|a.save}
    
  end
  
  def add_song(song)
    if song.artist != self
      song.artist = self
  end
    if !@songs.include?(song)
   @songs << song
 end 
 end
  
  def genres
    songs.map(&:genre).uniq
  end
  
  def self.find_by_name(name)
    @@all.detect{|artist| artist.name == name}
  end
 
end