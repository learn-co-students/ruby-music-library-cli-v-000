class Genre
  attr_accessor :name, :artist, :song
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def self.destroy_all
    self.all.clear
  end

  def genre=(song)
    song.genre ||= self
    self.songs << song unless self.songs.include?(song)
  end

  def songs
    @songs
  end

end
