class Genre

  extend Concerns::Findable

  attr_accessor :name
  @@all =[]

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
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def add_song(song)
    song.genre = self unless song.genre != nil
    @songs << song unless @songs.include?(song)
  end

  def artists
    self.songs.collect{|s| s.artist}.uniq
  end
end
