require_relative './concerns/findable.rb'
class Genre
  extend Concerns::Findable

  @@genres = []
  
  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@genres
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end

  def save
    @@genres << self
  end

  def self.destroy_all
    self.all.clear
  end

  def artists
    @songs.map{|song| song.artist}.uniq
  end

   def add_song(song)
    if @songs.include?(song) == false
      @songs << song
      song.genre = self 
    end
  end

end