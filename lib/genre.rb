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

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end

  def add_song(song)
    if !self.songs.include?(song)
      self.songs << song
    else
      self.songs.find(song)
    end
    song.genre = self if song.genre == nil
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end
end
