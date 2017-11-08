class Genre
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :genre

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def genre=(genre)
    @genre = genre
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.genre = self unless song.genre == self
  end

  def songs
    @songs
  end

  def artists
    @songs.collect { |song| song.artist }.uniq
  end

  def save
    @@all << self
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end
end
