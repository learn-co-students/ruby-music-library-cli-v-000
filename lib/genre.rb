class Genre
  
  attr_accessor :name
  
  attr_reader :songs, :artist
  
  extend Concerns::Findable
  
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
    genre = self.new(name)
    genre.save
    genre
  end
  
  def add_song(song)
    if song.genre === nil
      song.genre = self
    end
    if @songs.include?(song) === false
      @songs << song
    end
  end
  
  def artists
    artists_array = @songs.collect {|song| song.artist}
    artists_array.uniq
  end
  
end