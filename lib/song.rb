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
  
  def self.new_from_filename(filename)
    newitems = filename.split(/ \- |\./)
    newsong = self.find_or_create_by_name(newitems[1])
    newsong.artist = Artist.find_or_create_by_name(newitems[0])
    newsong.genre = Genre.find_or_create_by_name(newitems[2])
    newsong
    
    #songname = newitems[1]
    #artistname = newitems[0]
    #genrename = newitems[2]
    #song = self.new(songname)
    #song.artist = artistname
  end
  
  def self.create_from_filename(filename)
  end
end