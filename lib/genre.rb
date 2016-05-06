class Genre
  extend Concerns::Findable
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = [] # has_many songs inerface
  end

  def add_song(song) # has_many songs inerface
    songs << song unless songs.include?(song)
    song.genre = self unless song.genre == self
  end

  def songs # has_many songs inerface
    @songs
  end

  def save
    self.class.all << self
  end

  def artists
    songs.map { |s| s.artist }.uniq
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
    all.clear
  end
end