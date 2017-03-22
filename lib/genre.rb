class Genre

# attributes, variables, modules
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

# initialize
  def initialize(name)
    @name = name
    @songs = []
  end

# class methods
  def self.all
    @@all
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def self.destroy_all
    @@all.clear
  end

# instance methods
  def save
    @@all << self
  end

  def add_song(song)
    unless @songs.include?(song)
      @songs << song
    unless song.genre == self
      song.genre = self
    end
  end
  end

  def artists
    self.songs.map {|song| song.artist}.uniq
  end
end
