class Artist
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  # Class Methods
  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    artist = Artist.new(name)
    @@all << artist
    artist
  end

  # Instance Methods
  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self if song.artist != self
  end

  def songs
    @songs
  end

  def save
    @@all << self
  end

  def genres
    @songs.collect do |song|
      song.genre
    end.uniq
  end

end
