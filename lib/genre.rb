class Genre 
    attr_accessor :name, :songs
    extend Concerns::Findable
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs=[]
   
  end 
  
  def self.all 
    @@all
  end 
  
  def save
    @@all << self
  end 
  
  def self.destroy_all 
    @@all.clear 
  end 
  
   def self.create(genre) 
    genre = self.new(genre)
    genre.save 
    genre 
 end 
 
 def songs 
   @songs 
end

def artists 
  artist_collection =[]
  self.songs.each do |song|
    if !artist_collection.include?(song.artist)
      artist_collection << song.artist 
    end 
  end 
  artist_collection.uniq 
end 
  

  
end 