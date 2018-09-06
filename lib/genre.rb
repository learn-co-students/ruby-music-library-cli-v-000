class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs
  
  @@all = []
  
  def self.all
    @@all
  end
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def save
    @@all << self
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end
  
  def artists
    @songs.collect{|s| s.artist}.uniq
  end
  
  def add_song(song)
    if !@songs.include?(song)
      @songs << song
    end
    if song.genre.nil?
      song.genre = self
    end 
  end
  
end