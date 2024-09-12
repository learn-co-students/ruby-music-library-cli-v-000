class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    self.songs << song unless songs.include?(song)
    song.artist = self unless song.artist
    song
  end

  def save
    @@all << self
  end

  def genres
    songs.collect { |song| song.genre }.uniq
  end

  #class methods

  def self.create(name)
    artist = new(name)
    artist.save
    artist
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end


end #class Artist
