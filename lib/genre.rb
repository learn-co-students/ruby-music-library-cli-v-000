class Genre
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def song
    @song
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

  def self.create(genre)
    genre = self.new(genre)
    genre.save
    genre
  end

  def add_song(songs)
    @songs << song unless @songs.include?(songs)
    songs.genre = self unless songs.genre == self
  end

  def artists 
    self.songs.map{|song| song.artist}.uniq
  end

end