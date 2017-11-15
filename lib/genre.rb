require 'pry'

class Genre
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    self.name = name
    self.songs = []
  end

  def self.create(name)
    new_instance = self.new(name)
    new_instance.save
    new_instance
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def add_song(song_object)
    self.songs << song_object unless self.songs.include?(song_object) #add song to collection if it's not in it
    song_object.genre ||= self #add self as song's genre unless song already has an artist
  end

  def artists
    self.songs.collect { |song| song.artist }.uniq
  end
end
