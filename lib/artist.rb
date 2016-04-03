class Artist
  @@all = []
  attr_accessor :name, :genre
  def initialize(name)
    @name = name
    @songs = []
    @genres1 = []
  end

  def songs
    @songs
  end

  def add_song(song)
    if !(@songs.include?(song))
    @songs << song
    song.artist= self
    end
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

  def genres
    @songs.each do |song|
      @genres1 << song.genre
    end
    @genres1.uniq
    end
end