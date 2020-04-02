class Genre
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @songs = []
    @name = name
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end

  def add_song(song)
    self.songs << song
  end

  def artists
    self.songs.collect{|song| song.artist}.uniq
  end

  def self.alpha_genres
    @@alpha_genres = self.all.sort {|a, b| a.name <=> b.name}
  end

end
