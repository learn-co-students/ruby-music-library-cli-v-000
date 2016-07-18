class Song

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
  end
 
  def save
    @@all << self
  end
 
  def self.all
    @@all
  end
 
  def self.destroy_all
    @@all.clear
  end

  def self.create(name, artist = nil, genre = nil)
    Song.new(name).tap {|song| song.save}
  end
 

end