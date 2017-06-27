class Genre
  attr_accessor :name

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
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(genre_name)
    genre = Genre.new(genre_name)
    @@all << genre
    genre
  end

  def artists
    something = @songs.collect {|x| x.artist}
    something.uniq
  end
end
