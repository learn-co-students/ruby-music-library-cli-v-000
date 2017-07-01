class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs, :genres
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

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    artist = Artist.new(name)
    @@all << artist
    artist
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    end
    unless @songs.include?(song)
      @songs << song
    end
  end

  def songs
    @songs
  end

  def genres
    genres = []
    @songs.collect do |song|
      genres << song.genre
    end
    genres.uniq
  end

end
