class Genre
  attr_accessor :name
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
    genre = self.new(name)
    genre.save
    genre
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs << song if !@songs.include?(song)
    song.genre = self if song.genre == nil
  end

  def artists
    artists = []
      self.songs.each do |song|
        artists << song.artist if !artists.include?(song.genre)
      end
      artists.uniq
  end

end
