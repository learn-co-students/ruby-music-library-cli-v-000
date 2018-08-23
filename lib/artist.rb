class Artist
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
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
    artist = Artist.new(name)
    @@all << artist
    artist
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
      @songs << song
      @songs.uniq!
    else
      @songs << song
      @songs.uniq!
    end
  end

  def genres
    genres = []
    self.songs.each do |song|
      genres << song.genre
      genres.uniq!
    end
    genres
  end

end
