require_relative "../config/environment.rb"

class Genre
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
    genre = self.new(name)
    genre.save
    genre
  end

  def add_song(song)
    @songs << song
  end

  def artists
    artists_array = []
    @songs.each do |song|
      artists_array << song.artist
    end
    artists_array.uniq
  end

end
