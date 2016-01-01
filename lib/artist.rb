require_relative '../concerns/findable.rb'
class Artist
  attr_accessor :name, :songs 
  extend Concerns::Findable 

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
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
    new_artist = Artist.new(name)
    new_artist.save 
    new_artist
  end

  def add_song(song)
    self.songs << song unless self.songs.include?(song)
    song.artist = self unless song.artist == self 
  end

  def genres
    unique_genres = []
    self.songs.each do |song|
      unique_genres << song.genre unless unique_genres.include?(song.genre)
    end 
    unique_genres
  end 


  def print
    puts self.name
  end

  def self.print_all
    self.all.each do |artist|
      artist.print
    end
  end
  
end
