class Genre
  extend Concerns::Findable
  attr_accessor :name, :genre, :artist, :songs
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.genre = self unless song.genre
  end
  
  def self.all 
   @@all
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def self.find_by_name(genre_name)
    self.all.detect{|genre| genre.name == genre_name}
  end

  def self.find_or_create_by_name(genre_name)
    self.find_by_name(genre_name) || self.new(genre_name)
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end
end

