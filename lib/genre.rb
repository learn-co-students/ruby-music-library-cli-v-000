class Genre
  attr_accessor :name, :songs
  extend Concerns::Findable

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
    self
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
  end

  def add_song(song)
    @songs << song
    song.genre = self unless song.genre ==  self
  end

  def artists
    self.songs.collect{|k| k.artist}.uniq
  end
end
