class Genre
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs
  @@all = []

  def self.create(name)
    new(name).tap { |g| g.save}
  end

  def initialize(name)
    @name = name
    @songs = []
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

  def songs
    @songs
  end

  def add_song(song)
    @songs << song if songs.include?(song) == false
  end

  def artists
    songs.collect { |s| s.artist }.uniq
  end



end
