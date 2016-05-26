class Genre
  extend Concerns::Findable

  attr_reader :songs
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
    @@all.clear
  end

  def self.create(genre_name)
    song = Genre.new(genre_name)
    song.tap {|x| x.save}   
  end

  def save
    Genre.all << self
  end

  def artists
    songs.map {|song| song.artist}.uniq
  end

end