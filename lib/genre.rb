require_relative '../concerns/findable.rb'
class Genre
  attr_accessor :name, :songs 
  attr_reader :artist
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
    new_genre = Genre.new(name)
    new_genre.save
    new_genre 
  end

  def add_song(song)
    self.songs << song unless self.songs.include?(song)
    song.genre = self unless song.genre == self 
  end 

  def artists 
    unique_artists = []
    self.songs.each do |song|
      unique_artists << song.artist unless unique_artists.include?(song.artist)
  end
  unique_artists
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