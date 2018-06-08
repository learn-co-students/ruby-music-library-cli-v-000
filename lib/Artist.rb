require "pry"
class Artist

  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    # @@all
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    create = new(name)
    create.save
    create
  end

  def add_song(song)
    @songs << song if song.artist != self
    song.artist = self if song.artist != self
  end

  def genres
  songs.map(&:genre).uniq
    # Song.all.collect {|song| song.genre}.uniq
  end
end
