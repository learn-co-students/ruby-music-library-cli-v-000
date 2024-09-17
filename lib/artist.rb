class Artist
  attr_accessor :name, :songs
  extend Concerns::Findable
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    artist = new(name)
    artist.save
    artist
  end

  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end

  def add_song(song)
    song.artist = self
    if !@songs.include?(song)
      @songs << song
    end
  end

  def save
    @@all << self
  end

  def genres
    genres = []
    self.songs.each do |song|
      genres << song.genre
    end
    genres.uniq
  end

  def to_s
    self.name
  end
end
