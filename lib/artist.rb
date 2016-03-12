class Artist
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
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
    result = all.find { |artist| artist.name == name }
    if result
      result
    else
      artist = new(name)
      artist.save
      artist
    end
  end

  def add_song(song)
    songs << song if !songs.include?(song)
    song.artist = self if song.artist != self
  end

  def genres
    songs.collect { |song| song.genre }.uniq
  end

end
