class Genre
  attr_accessor :name

  extend Concerns::Findable

  @@all = []

  def initialize (name)
    @name = name
    @songs = []
  end

  def songs
    @songs
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

  def artists
    @songs.collect {|song| song.artist}.uniq
  end

  # def add_song(song)
  #   if song.genre != self
  #   @songs << song
  #   song.genre = self
  #  end
  # end
end
