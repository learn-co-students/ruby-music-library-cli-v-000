class Genre
  extend Concerns::Findable 
  attr_accessor :name, :songs 
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
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
    new_genre = self.new(name)
    @@all << new_genre
    new_genre
  end
  
  def add_song(song)
    unless @songs.include?(song)
      @songs << song
    end
    if song.genre == [] || song.genre == nil  
      song.genre = self
    end
  end
  
  def artists
    songs = @songs  
    artists = songs.map {|song| song.artist}
    artists = artists.uniq
  end 
  
end 