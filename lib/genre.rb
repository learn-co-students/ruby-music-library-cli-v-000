class Genre
  attr_accessor :name, :songs, :artist
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    save
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
    new(name).tap{|g| g.save}
  end
  
  def artists
    self.songs.collect do |song|
      song.artist
    end.uniq
  end
  
end