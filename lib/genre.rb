class Genre
  extend Concerns::Findable
  @@all = []
  attr_accessor :name
  
  def initialize(name)
    @name = name
    @songs = []
   # @artists = []
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
  
  def self.create(genre)
    new_genre = Genre.new(genre)
    new_genre.save
    new_genre
  end
  
  def songs
    @songs
  end
  
  def artists
    #@artists
    songs.collect {|a| a.artist}.uniq
  end
  
  def add_song(song)
    unless @songs.include?(song)  
      @songs << song
    end
    song.genre ||= song.genre = self
  end
end