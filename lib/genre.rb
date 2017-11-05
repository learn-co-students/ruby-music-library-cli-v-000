require_relative "concerns/findable.rb"

class Genre
  extend Concerns::Findable

  #Variables
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    Genre.new(name).tap do |genre|
      genre.save
    end
  end

  def self.find_or_create_by_name(name)
    @@all.each do |genre|
      if genre.name == name
        return genre
      end
    end
    genre = Genre.new(name)
    @@all << genre
    genre
  end

  #Methods
  def add_song(song)
    @songs << song unless @songs.include?(song)
  end

  def songs
    @songs
  end

  def artists
    artists = []
    @songs.collect do |song|
      artists << song.artist unless artists.include?(song.artist)
    end
    artists
  end

  def save
    if !@@all.include?(self)
      @@all << self
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

end
