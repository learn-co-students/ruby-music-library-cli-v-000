require_relative 'concerns/findable.rb'

class Artist

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
    new_song = Artist.new(song)
    new_song.save
    new_song
  end

  def add_song(song)
    if self.songs.include?(song)
      self.songs.find(song)
    else
      self.songs << song
    end

    if song.artist == self
      song.artist
    else
      song.artist = self
    end
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end

end