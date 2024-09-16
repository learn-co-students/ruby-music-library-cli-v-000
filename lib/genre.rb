class Genre 
  attr_accessor :name, :songs 
  extend Concerns::Findable
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    genre = self.new(name)
  end
  
  def save
    @@all << self
  end
  
  def artists
    artists = []
    @songs.each do |instance|
      test_artist = instance.artist
      if !artists.include?(test_artist)
      artists << test_artist
      end
    end
    artists
  end
end