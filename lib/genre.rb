class Genre
  extend Concerns::Findable
  attr_accessor :name, :song

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    if !@songs.include?(song)
      @songs << song
    end
  end

  def artists
    songs.map { |song| song.artist }.uniq
  end

  def self.all
    @@all
  end

  def songs
    @songs
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    name = self.new(name)
    @@all << name
    name
  end

end
