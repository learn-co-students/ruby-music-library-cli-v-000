class Genre 
  
  extend Concerns::Findable 
  attr_accessor :name, :songs, :artists  
  @@all = []
  
  def initialize(name)
   @name=name
   @songs = []
  end 

  def save
    @@all << self 
  end 

  def self.all
    @@all
  end 

  def self.destroy_all
    @@all.clear 
  end 
  
  def self.create(name)
    new_genre = Genre.new(name)
    @@all << new_genre
    new_genre
  end 
  
  def songs 
    @songs 
  end 

   def artists                     
    new_array = songs.map do |song|
      song.artist
    end 
    new_array.uniq
  end 
  
end 
