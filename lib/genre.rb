class Genre
  attr_accessor :name, :songs, :artists 

  extend Concerns::Findable

  @@all = [] 

  def initialize(name)
    @name = name 
    @@all << self 
    @songs = []
    @all_artists = []
  end


  def Genre.all 
    @@all 
  end

  def artists 
    @all_artists
  end

  def Genre.destroy_all
    Genre.all.clear
  end

  def save 
    Genre.all 
  end

  def Genre.create(genre)
    item = Genre.new(genre)
  end
end


