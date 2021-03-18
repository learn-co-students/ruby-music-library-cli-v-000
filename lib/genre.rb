class Genre

  attr_accessor :name, :artist, :songs
  # has_many :songs

  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def songs
    @songs
  end

  def artists
    @songs.collect{|s| s.artist}.uniq
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

end
