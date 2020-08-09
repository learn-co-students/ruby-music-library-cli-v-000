class Genre
  extend Concerns::Findable

  @@all = []
  attr_accessor :name, :songs, :artist
  
  def initialize(name, songs = nil, artist = nil)
    @name = name
    # @@all << self
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end
  
  def artists
    songs.collect {|s| s.artist}.uniq
  end

end