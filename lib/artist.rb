class Artist
  extend Concerns::Findable 
  attr_accessor :name, :songs, :genre  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all 
    @@all 
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def save
    @@all << self 
  end
  
  def self.create(name)
    new_artist = self.new(name)
    new_artist.save 
    #@@all << new_artist
    new_artist
  end 
  
  def songs
    @songs 
  end
  
  def add_song(song)
    unless @songs.include?(song)
      @songs << song
    end
    if song.artist == [] || song.artist == nil  
      song.artist = self
    end
  end
  
  def genres
    songs = @songs  
    genres = songs.map {|song| song.genre}
    genres = genres.uniq
  end 
end 