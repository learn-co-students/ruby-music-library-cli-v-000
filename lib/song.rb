require "pry"
class Song 
  attr_accessor :name, :genre, :artist    
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) if artist
    self.genre=(genre) if genre
    save
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
    song = self.new name
    @@all << song.save
  end 
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end

  # def self.find_or_create_by_name(name)
  #   if find_by_name(name) 
  #     return find_by_name(name)
  #   else
  #     create_by_name(name)
  #   end
  # end
end