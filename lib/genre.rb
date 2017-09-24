require_relative '../concerns/concerns.rb'
class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs
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
    if @songs.include?(song) == false
    @songs << song
    end
    if song.genre.nil?
    song.genre = self
    end
  end

  def artists
    @songs.collect {|song| song.artist}.uniq
  end

end