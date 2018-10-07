class Artist
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def name
    @name
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
    artist = Artist.new(name)
    artist.save
    return artist
  end

  def songs
    @songs
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    end
    if @songs.include?(song) == false
      @songs << song
    end
  end

  def genres
    results = []
    songs = self.songs
    songs.each do |song|
      if results.include?(song.genre) == false
        results << song.genre
      end
    end
    return results
  end

  extend Concerns::Findable

end
