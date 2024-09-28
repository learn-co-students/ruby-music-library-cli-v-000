class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs, :song
  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self if song.artist == nil
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

end
