require_relative '../lib/concerns/Concerns::Findable.rb'

class Genre
  extend Concerns::Findable 

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name=name
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
    genre=Genre.new(name)
    genre.save
    genre
  end

  def add_song(song)
    @songs << song unless self.songs.include?(song)
    song.genre=self unless song.genre == self
  end

  def artists
    @songs.collect {|song| song.artist}.flatten.uniq
  end

end