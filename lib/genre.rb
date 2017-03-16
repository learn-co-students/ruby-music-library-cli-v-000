class Genre
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    #binding.pry
    @songs = []
  end

  def self.all
    #binding.pry
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    #binding.pry
    @@all << self
  end

  def self.create(name)
    genre = Genre.new(name)
    #binding.pry
    genre.save
    genre
  end

  def add_song(song)
    song.genre = self unless song.genre == self
    @songs << song unless @songs.include?(song)
  end

  def add_genre(song)
    song.genre = self unless song.genre == self
    @genres << song unless @genres.include?(song)
  end

  def artists
    self.songs.collect{|s| s.artist}.uniq
  end
end
