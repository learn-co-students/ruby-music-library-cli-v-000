class Artist

  extend Concerns::Findable
  extend Concerns::ClassMethods

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = Artist.new(name)
    self.all << artist
    artist
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    self.songs << song unless self.songs.include?(song)
  end

  def songs
    @songs
  end

  def genres
    genres = []
    self.songs.each do |song|
      genres << song.genre unless genres.include?(song.genre)
    end
    genres
  end

end
