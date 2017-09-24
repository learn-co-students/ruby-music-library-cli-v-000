require_relative '../config/environment'

class Genre
  extend Concerns::Findable
  attr_accessor :songs, :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    self.class.all << self
    self
  end

  def add_song(song)
    unless song.genre == self
      song.genre = self
    end
    unless self.songs.include?(song)
      self.songs << song
    end
  end

  def artists
    self.songs.map { |song| song.artist }.uniq
  end

  def self.create(name)
    instance = self.new(name)
    instance.save
    instance
  end


  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end
end
