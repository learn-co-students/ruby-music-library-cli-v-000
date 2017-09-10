class Genre
  attr_accessor :name, :songs
  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @@all
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    @@all << self
  end

  def new(name)
    Genre.new(name)
  end

  def add_song(song)
    song.genre = self if song.genre.nil? ## How do these work?
    songs << song unless songs.include?(song)
  end

  def artists
    ## collects genres through its songs instead of maintaining its own @genres instance variable (artist has many genres through songs)
    songs.map { |song| song.artist }.uniq
  end

end