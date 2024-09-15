class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def songs
     @songs
  end

  def genres
    songs.collect { |song| song.genre }.uniq
  end

  def add_song(song)
    song.artist = self unless song.artist
    @songs << song unless @songs.include?(song)
  end

  def self.all
    @@all
  end

  def self.create(name)
    self.new(name).tap { |artist| artist.save }
  end

  def self.destroy_all
    self.all.clear
  end
end
