class Genre
  extend Concerns::Findable  
  
  attr_accessor :name, :songs
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
    self.save
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    all.clear
  end
  
  def self.create(name)
    genre = Genre.new(name)
  end
  
  def add_song(song)
    @songs << song
  end

  def artists
    artists = []
    @songs.each do |song|
      artists << song.artist
    end
    artists.uniq
  end
  
end