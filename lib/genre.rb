class Genre 
  extend Concerns::Findable
  attr_accessor :name, :songs 
  @@all = []
  def initialize(name, artists = nil)
    @name = name 
    @songs = []
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
  
  def self.create(genre_klass)
    genre_created = Genre.new(genre_klass)
    genre_created.save 
    genre_created
  end
  
  def add_song(song)
     song.genre = self unless song.genre
     @songs << song unless songs.include?(song)
    end
    
  def artists
    self.songs.collect{|s| s.artist}.uniq
  end
end