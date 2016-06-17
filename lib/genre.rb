class Genre
  extend Concerns::Findable
  @@all = []

  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
  end

  def songs
    @songs
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def self.all
    @@all
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end

  def self.destroy_all
    self.all.clear
  end
end
