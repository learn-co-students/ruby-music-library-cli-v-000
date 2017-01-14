class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
  end

  def artists
    self.songs.collect { |song| song.artist }.uniq
  end

  def save
    @@all << self
  end

  def self.create(name)
    genre = self.new(name)
  end

  def self.destroy_all
    @@all.clear
  end

end
