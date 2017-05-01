require 'pry'

class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    new_instance = self.new(name)
    new_instance.save
    new_instance
  end

  def artists
    artists = []
    all_artists = self.songs.collect {|song| song.artist}
    all_artists.each {|artist| artists << artist unless artists.include?(artist)}
    artists
  end

end
