require 'pry'

class Genre
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    self.save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    genre = Genre.new(name)
  end

  def add_song(song)
    self.songs << song unless self.songs.include?(song)
  end

  def artists
    songs.collect {|s| s.artist}.uniq
  end

end
