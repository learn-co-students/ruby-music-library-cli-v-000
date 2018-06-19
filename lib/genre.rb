class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs

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

  def self.create(name)
    genre = Genre.new(name)
    @@all << genre
    @@all.last
  end

  def artists
    not_nil = @songs.select {|song| song.artist != nil}
    not_nil.map {|song| song.artist}.uniq
  end

end
