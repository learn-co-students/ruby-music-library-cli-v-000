require_relative './findable_module.rb'

class Song
  extend Concerns::Findable
  
  attr_accessor :destroy_all, :create, :name, :artist, :genre
  
  def initialize(name,artist=nil,genre=nil)
    @name = name
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
  end
  
  @@all = []

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
    song = Song.new(name)
    song.save
    song
  end
  
  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end
  
  def genre=(genre)
    #binding.pry
    @genre = genre
    @genre.songs << self unless @genre.songs.include?(self)
  end
  
  def self.find_by_name(name)
    #binding.pry
    @@all.detect{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create(name)
    else
      self.find_by_name(name)
    end
  end
end