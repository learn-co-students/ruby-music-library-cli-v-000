class Genre
  extend Concerns::Findable
  
  attr_accessor :name
  
  @@all = []
  
  def self.all
    @@all
  end
  
  def initialize(name)
    @name = name
    @songs = []
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
    artists = songs.collect {|song| song.artist}
    artists.uniq
  end
  
end