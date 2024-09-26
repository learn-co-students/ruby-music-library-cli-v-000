class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs, :genres

  @@all = []

  def initialize(name)
    @name = name
    @songs = [] # association: artist has many songs
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

  def self.create(artist)
    artist = Artist.new(artist)
    artist.save
    artist
  end

  def add_song(song)
    song.artist = self if song.artist.nil?
    @songs << song unless @songs.include?(song)
  end

  # return a collection of genres for all of the artist's songs
  # do not return duplicates
  def genres
    self.songs.map { |song| song.genre }.uniq
  end

end
