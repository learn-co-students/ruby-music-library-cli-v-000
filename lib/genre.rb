require_relative 'concerns/findable.rb'

class Genre

  extend Concerns::Findable 
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    self.name = name
    self.songs = []
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

  def self.create(song)
    new_song = Genre.new(song)
    new_song.save
    new_song
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end

end