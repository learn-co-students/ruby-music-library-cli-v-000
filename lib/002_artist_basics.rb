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
    song.artist = self if song.artist == nil
    songs << song unless songs.include?(song)
  end

  def genres
    genres_all = []
    @songs.each do |song|
      genres_all << song.genre
    end
    genres_all.uniq
  end

end
