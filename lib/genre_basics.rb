require 'pry'
class Genre
  attr_accessor :name, :songs
  extend Concerns::Findable
  

#----------Genre methods-----------------
  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end
  
  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    new_genre = Genre.new(name)
    new_genre.save
    return new_genre
  end

  def self.destroy_all
    self.all.clear
  end

  def artists
    artist_array = self.songs.collect do |song|
      song.artist
    end
    artist_array.uniq
  end

  def add_song(song)
    song.genre == nil ? song.genre = self : nil
    if !(self.songs.include?(song)) 
      @songs << song
    end
  end
end #of genre class