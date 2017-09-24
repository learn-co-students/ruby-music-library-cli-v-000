class Genre
  extend Concerns::Findable
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
    self.all.clear
  end

  def add_song(song)
    songs << song unless songs.include?(song)
    song.genre || song.genre = self
  end

  def save
    self.class.all << self
  end

  def self.create(genre)
    new_genre = self.new(genre)
    new_genre.save
    new_genre
  end

  def songs
    @songs
  end

  def artists
    songs.map {|song| song.artist}.uniq
  end 

end