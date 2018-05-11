class Artist

  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = Array.new

  def initialize(name)
    @name = name
    @@all << self
    @songs = Array.new
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    self.new(name)
  end

  def save
    @@all << self
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist != nil
  end

  def genres
    songs.collect { |song| song.genre }.uniq
  end
end
