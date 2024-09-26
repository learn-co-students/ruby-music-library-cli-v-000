class Artist
  # inheritance
  extend Concerns::Findable

  # class variables
  @@all = []

  # attribute accessors
  attr_accessor :name, :songs

  # default and custom constructors
  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    new_artist = self.new(name)
    new_artist.save
  end

  # class methods
  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  # instance methods
  def save
    @@all << self
    self
  end

  def add_song(song)
    if !song.artist
      song.artist = self
    end
    if !self.songs.include?(song)
      self.songs << song
    end
  end

  def genres
    genres = []
    self.songs.each do |song|
      if !genres.include?(song.genre)
        genres << song.genre
      end
    end
    genres
  end

end
