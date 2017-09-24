require_relative '../config/environment'

class Artist
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
    unless song.artist == self
      song.artist = self
    end
    unless self.songs.include?(song)
      self.songs << song
    end
  end

  def genres
    self.songs.map { |song| song.genre }.uniq
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
