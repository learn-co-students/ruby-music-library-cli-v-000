class Genre
  attr_accessor :name

  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @@all = []
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

  def self.create(genre_name)
    genre = self.new(genre_name)
    genre.save
    genre
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.genre = self unless song.genre
  end

  def artists
    self.songs.collect{|song| song.artist}.uniq
  end
end