require 'pry'
class Song 
  extend Concerns::Findable
  
  attr_accessor :name, :genre
  attr_reader :artist
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) if artist != nil
    self.genre=(genre) if genre != nil
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    self.new(name).save
    self
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self if !genre.songs.include?(self)
  end
  
  def self.find_by_name(title)
    @@all.find {|s| s.name == title}
   end 
  
  def self.create(title)
    self.new(title).tap {|s| s.save}
  end 
  
  def self.find_or_create_by_name(title)
    self.find_by_name(title) ? self.find_by_name(title) : self.create(title)
  end
  
end