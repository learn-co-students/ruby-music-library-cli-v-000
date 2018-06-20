class Genre
  @@all = []
  
  attr_accessor :name

  def initialize(name)
    @name = name
    @songs = []
  end
  
  def create(name)
    new_genre = Genre.new(name)
    self.save
  end
  
  def artists
    @songs.collect do |song_name|
      song_name.artist
    end
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

end