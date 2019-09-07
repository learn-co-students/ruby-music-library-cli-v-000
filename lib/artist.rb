class Artist

  extend Concerns::Findable

  #accepts a name upon initialization and set that property
  #name property should be readable and writable by object

  attr_accessor :name
  attr_reader :songs

  @@all = []

# creates a 'songs' prperty set to an empty array (artist has many songs)
  def initialize(name)
    @name = name
    # @artist = artist if artist. Needs a reader.
    @songs = []
  end

#returns the artist's 'songs' collection (artists has many songs)
  def songs
    @songs
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    all.clear
  end

  def self.create(name)
    artist = new(name)
    artist.save
    artist
  end

  def add_song(song)
    song.artist = self unless song.artist
    songs << song unless songs.include?(song)
  end

  def genres
    songs.collect { |s| s.genre}.uniq
  end

end
