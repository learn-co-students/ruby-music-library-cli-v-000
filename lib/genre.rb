class Genre
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end

  def save
    @@all << self
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.genre = self if !song.genre
  end

  def self.create(name)
    @genre = self.new(name)
    @genre.save
    @genre
  end

  def self.destroy_all
    self.all.clear
  end

end
