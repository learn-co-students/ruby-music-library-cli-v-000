class Genre
  attr_accessor :name
  extend Concerns::Findable

  @@all = []

  def initialize(name)
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
    @@all.clear #turns out they benchmark at exactly the same speed.... 0ns.
  end

  def save
    @@all << self
  end

  def artists
    songartists = []; songs.each {|song| songartists << song.artist if !songartists.include?(song.artist)}; songartists
  end

  def self.create(genre)
    new_genre = Genre.new(genre); new_genre.save
    return new_genre
  end

end
