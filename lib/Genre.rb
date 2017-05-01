class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    save
    @songs = []
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(song)
   song = self.new(song)
  end 
 

  def artists
    self.songs.collect{|s| s.artist}.uniq
  end
end