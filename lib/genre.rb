class Genre
    attr_accessor :name
    #attr_reader :song
    
    @@all = []
    
  def initialize(name)
    @name = name
    @songs = []
  end
  
  
  def self.all
    @@all
  end
  
  def self.destroy_all 
    self.all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
   genre = self.new(name)
   genre.save
   genre
  end
  
  def songs
    @songs
  end
  
  def artists
     songs.collect do |song|
       song.artist
    end.uniq
  end

end