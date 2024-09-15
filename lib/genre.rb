class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs, :artist
  @@all = []
  
  def initialize(name)
    @name = name
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
  
  def self.create(name)
    new_genre = Genre.new(name)
    new_genre.save
    new_genre
  end
  
  def artists
    own_artists = self.songs.collect {|song| song.artist}
    own_artists.uniq
  end
end