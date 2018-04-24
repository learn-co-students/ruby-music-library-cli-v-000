require "pry"
class Song 
  attr_reader :artist, :genre
  attr_accessor :name  
  @@all = []

  def initialize(name = nil, artist = nil, genre = nil)
    @name = name
    self.artist= artist if artist
    self.genre= genre if genre
  end
  
  def genre
    @genre
  end
  
  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.all
    @@all
  end
  
  def artist
    @artist
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    song = self.new(name)
    song.save
    song  
  end 
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end
  
  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) 
      return self.find_by_name(name)
    else
      self.create(name)
    end
  end
end