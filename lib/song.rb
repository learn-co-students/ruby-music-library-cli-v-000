class Song 
extend Concerns::Findable

  attr_accessor :name, :genre, :artist
 
  @@all = []
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist != nil  
    self.genre = genre if genre != nil 
  end 
  
  def save 
    @@all << self 
  end 
  
  def self.all
    @@all
  end 
  
  def self.destroy_all 
    @@all = []
  end 
  
  def self.create(name)
    name = self.new(name)
    name.save
    name
  end 
  
  #def self.find_by_name(name)
    #self.all.find do |song| 
      #song.name == name 
    #end 
  #end 
  
  #def self.find_or_create_by_name(name)
      #self.find_by_name(name) || self.create(name)
  #end
  
 
  def artist_name
    self.artist.name
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre 
    genre.add_song(self)
  end 
  
  
  def self.name 
    @name 
  end 

  
end 