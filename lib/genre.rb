class Genre  
  extend Concerns::Findable
  attr_accessor :name, :song, :artist
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs= []
  end
  
  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.create(genre)
    new_genre = Genre.new(genre)
    new_genre.save
    new_genre
  end
  
  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.genre = self if song.genre == nil
  end
  
  def songs
    @songs
  end
  
  def artists
    self.songs.collect { |song| song.artist }.uniq
  end
end