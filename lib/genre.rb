class Genre
  
  attr_accessor :name, :songs
  
  @@all = []
  
  def initialize(name)
    @name= name
    @songs = []
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
  
  def self.create(genre_name)
    genre_name = Genre.new(genre_name)
    genre_name.save
    genre_name
  end

  def artists
    artists= @songs.collect {|song| song.artist}
    artists.uniq
  end
  
end
