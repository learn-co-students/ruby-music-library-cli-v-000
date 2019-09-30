class Genre  
  attr_reader :name 
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def name
    @name
  end
  
  def name=(name)
    @name = name
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    @name = name
    self.new(name).save
    self
  end
  
  def songs
    @songs
  end
  
  def artists
    genre_artists = []
    self.songs.each do |item|
      if !genre_artists.include?(item.artist)
        genre_artists << item.artist 
      end
    end
    genre_artists
  end
end