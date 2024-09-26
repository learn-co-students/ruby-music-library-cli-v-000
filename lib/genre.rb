class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs, :artists
  @@all = []

  def initialize(name)
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

  def self.create(name)
    genre = self.new(name)
    @@all << genre
    genre
  end
    
  def artists
     self.songs.collect {|song| song.artist}.uniq
  end  

  def self.count
     @@all.size
  end
end