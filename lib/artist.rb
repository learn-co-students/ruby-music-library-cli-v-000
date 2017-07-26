class Artist
  extend Concerns::Findable
  attr_accessor :name, :song
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def self.destroy_all
    self.all.clear
  end

  def songs
    @songs
  end

  def add_song(song)
    if @songs.include?(song)
      return
    end
    @songs << song
    song.artist = self if song.artist == nil
  end

  def genres
    artist_genres = songs.collect {|song| song.genre}
    artist_genres.uniq
  end

end
