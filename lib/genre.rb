class Genre

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
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    @@all << self.new(name)
    self
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.genre = self if !song.genre
  end

  end
