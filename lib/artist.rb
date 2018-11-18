require 'pry'
#require_relative './song.rb'
#require_relative './music_importer.rb'
#require_relative './genre.rb'
#require_relative './concerns/findable.rb'


class Artist
  extend Concerns::Findable
  
  attr_accessor :name
  attr_reader :songs

  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end
  
  def add_song(song)
    unless song.artist.instance_of?(Artist)
      song.artist = self
    end
    unless self.songs.include?(song)
      self.songs << song
    end
    song
  end
  
  def genres
    self.songs.collect {|song| song.genre}.uniq
  end
    
end


#tom = Artist.new("Tom")
#song = Song.new("Hello")
#tom.add_song(song)
#folk = Genre.new("Folk")
#song2 = Song.new("Goodbye")
#bluegrass = Genre.new("Bluegrass")
#song3= Song.new("Sup")
#tom.add_song(song2)
#tom.add_song(song3)
#song.genre = folk
#song2.genre = folk
#song3.genre = bluegrass
#tom.genres