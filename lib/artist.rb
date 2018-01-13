class Artist
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    self.genres
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def songs
    @songs
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def add_song(song)
    @songs << song if !@songs.include?(song)
    song.artist = self if song.artist == nil
  end

  def genres
    genres = []
      self.songs.each do |song|
        genres << song.genre if !genres.include?(song.genre)
      end
      genres.uniq
    end



end
