class Artist
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
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    end
    if self.songs.all? { |a| a != song }
      @songs << song
    end
  end

  def songs
    @songs
  end

  def genres
    genres = []
    self.songs.each do |song|
      genres << song.genre if genres.all? { |g| g != song.genre }
    end
    return genres
  end
end
