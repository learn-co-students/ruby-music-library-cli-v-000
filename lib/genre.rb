class Genre
  extend Concerns::Findable
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []

    self.save
  end

  def add_song(song)
    unless @songs.include?(song)
      @songs << song
    end

    unless song.genre == self
      song.genre = self
    end
  end

  def artists
    @songs.collect {|song| song.artist}.uniq
  end

  def songs
    @songs
  end

  def name
    @name
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.create(name)
    genre = self.new(name)
    self.all << genre
    genre
  end

  def self.destroy_all
    @@all.clear
  end
end
