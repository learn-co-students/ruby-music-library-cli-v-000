class Genre
  extend Concerns::Findable

  attr_accessor :name

  @@all = []

##### INSTANCE METHODS
  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def songs
    @songs
  end

  def add_song(song)
    song.genre = self unless song.genre
    @songs << song unless @songs.include?(song)
  end

  def artists
    @songs.collect do |song|
      song.artist
    end.uniq
  end

##### CLASS METHODS
  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end
end
