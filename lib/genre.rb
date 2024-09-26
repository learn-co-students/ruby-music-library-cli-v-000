class Genre
  
  extend Concerns::Findable
  attr_accessor :name
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    save
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
  
  def self.create(genre_name)
    new_genre = self.new(genre_name)
  end
  
  def songs
    @songs
  end
  
  def add_song(song)
    if song.genre == nil || song.genre != self
      song.genre = self
    end
    
    if !@songs.include?(song)
      @songs << song
    end
  end
  
  def artists
    @songs.collect {|song| song.artist}.uniq
  end
end
  