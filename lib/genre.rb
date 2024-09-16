class Genre
  extend Concerns::Findable
  @@all = []
  attr_accessor :name 
  
  def initialize(name)
    @name = name 
    @songs = []
  end
  
  def self.all
    @@all
  end 
  
  def self.destroy_all
    self.all.clear
  end 
  
  def save
    @@all << self
  end 
  
  def self.create(name)
    new_genre = Genre.new(name)
    new_genre.save
    new_genre
  end 
  
  def songs
    @songs
  end
  
  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self if song.genre != self
  end
  
  def artists
    artists = @songs.collect do |song, artist|
      song.artist
    end
    artists.uniq
  end
end