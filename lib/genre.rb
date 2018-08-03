class Genre
  extend Concerns::Findable 
  attr_accessor :name
  attr_reader :songs
   @@all = []
  def initialize(name)
    @name =name 
    @songs = []
    save
  end
  
  def self.all
    @@all
  end 
  
  def self.destroy_all
    all.clear 
  end 
  
  def save 
      @@all << self
  end
  
  def self.create(genre)
    self.new(genre)
  
  end
  
  def self.find_by_name(name)
    @@all.detect{|artist| artist.name == name}
  end
  
 def artists
     @songs.collect {|s| s.artist}.uniq
    
  end
end