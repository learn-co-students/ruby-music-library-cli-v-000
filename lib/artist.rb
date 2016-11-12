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
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    return artist
  end

  def add_song(song)
    if !@songs.include?(song)
      @songs << song
    end

    if song.artist != self
      song.artist = self
    end

  end

  def genres
    unique_genres = []
    self.songs.collect do |song|
      unique_genres << song.genre
    end
    return unique_genres.uniq
  end

end
