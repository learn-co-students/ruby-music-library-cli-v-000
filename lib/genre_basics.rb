require 'pry'
class Genre
  attr_accessor :name, :songs
  extend Concerns::Findable
  
#----------Instance methods-----------------
  @@all = []

  def save
    @@all << self
  end
  
  def initialize(name)
    @name = name
    @songs = []
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

#----------Class methods-----------------
  def self.all
      @@all
    end

  def self.create(name)
      new_genre = Genre.new(name)
      new_genre.save
      return new_genre
  end

  def self.destroy_all
    self.all.clear
  end
end #of genre class