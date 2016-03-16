require_relative "concerns/findable.rb"
class Genre
  extend Concerns::Findable
  attr_accessor :name, :genre, :songs
  @@all = []

  def initialize(genre)
    @songs = []
    @name = genre
  end
  def self.all 
    @@all
  end
  def self.destroy_all
    @@all.clear
  end
  def save
    @@all << self
    self
  end
  def self.create(genre)
    genre = self.new(genre)
    genre.save
  end
  def add_song(song)
   if !@songs.include?(song)
      @songs << song
      song.genre = self 
    end
  end
  def artists
      @songs.collect {|song| song.artist}.uniq
  end
end