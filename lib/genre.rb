class Genre
  extend Concerns::Findable
  
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def artists
    songs.collect {|song| song.artist}.uniq
  end

  def songs
    @songs
  end

  def add_song(song)
    song.genre = self unless song.genre
    songs << song unless songs.include?(song)
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
    genre = new(name)
    genre.save
    genre
  end
end
