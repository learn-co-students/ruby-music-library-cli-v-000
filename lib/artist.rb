class Artist
  attr_accessor :name, :songs

  @@all = []

  extend Concerns::Findable

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

  def self.create(name)
    self.new(name).save
  end

  def save
    self.class.all << self
    self
  end

  def add_song(song)
    if !self.songs.include?(song)
      self.songs << song
    end

    if !song.artist
      song.artist = self
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