class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs, :artists

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    new_genre = Genre.new(name)
    new_genre.save
    new_genre
  end

  def add_song(song)
    @songs << song if !(@songs.include?(song))
    song.genre = self if song.genre == nil
  end

  def artists
    list = []
    @songs.collect do |song|
      list << song.artist if !(list.include?(song.artist))
    end
    list
  end
end
