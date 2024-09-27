require_relative '../concerns/findable.rb'

class Genre 
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    self.name = name 
    @songs = []
  end 

  def songs
    @songs 
  end

  def add_song(song)
    song.genre = self unless song.genre == self
    @songs << song unless @songs.include?(song)  
  end

  def artists
    artists = []
    self.songs.collect do |song|
      artists << song.artist unless artists.include?(song.artist)
    end
    artists
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
    created_genre = Genre.new(name)
    created_genre.save
    created_genre
  end 

  def print 
    puts self.name
  end

   def self.print_all
    self.all.each do |genre|
      genre.print
    end
  end
end 