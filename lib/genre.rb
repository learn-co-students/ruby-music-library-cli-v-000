class Genre
  extend Concerns::Findable

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
    genre = Genre.new(name)
    genre.save
    genre
  end

  def add_song(song)
    @songs.include?(song) ? nil : @songs << song
    song.genre ? nil : song.genre = self
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end

end