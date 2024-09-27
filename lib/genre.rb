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

  def save
    @@all << self
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    genre = Genre.new(name)
    self.all << genre
    genre
  end

  def add_song(song)
    unless @songs.include?(song)
      @songs << song
    end
    if song.genre == nil
      song.genre = self
    end
  end

  def songs
    @songs
  end

  def artists
    @songs.collect {|song|
      song.artist}.uniq
  end

  def self.list_genres
    @@all.collect {|genre|
      puts genre.name}
  end
end
