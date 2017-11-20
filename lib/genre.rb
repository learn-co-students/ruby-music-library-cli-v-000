class Genre
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    self.name = name
    @songs = []
  end

  def save
    self.class.all << self
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

  def add_song(song)
    song.genre = self if song.genre == nil
    songs << song if !songs.include?(song)
  end

  def artists
    self.songs.collect{|s| s.artist}.uniq
  end

end
