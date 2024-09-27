class Genre
  # Initial Set Up
  extend Concerns::Findable

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  # Class Methods
  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end

  # Instance Methods
  def save
    @@all << self
    self
  end

  def add_song(song)
    if !@songs.include?(song)
      @songs << song
    end
  end

  def songs
    @songs
  end

  def artists
    self.songs.collect do |song|
      song.artist
    end.uniq
  end
end
