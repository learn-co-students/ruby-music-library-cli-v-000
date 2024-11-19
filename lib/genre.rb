class Genre
  attr_accessor :name, :songs
  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end

  def songs
    @songs
  end

  def artists
    self.songs.collect {|song|
      song.artist}.uniq
  end

  #def to_s
  #  self.name
  #end

  def add_song(song)
    #self.songs << song
    song.genre = self unless song.genre == self
    @songs << song unless @songs.include?(song)
  end

  def self.destroy_all
    @@all.clear
  end
end
