class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @songs = []
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
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
    artists = Artist.new(name)
    artists.save
    artists
  end

  def genres
    self.songs.collect {|s| s.genre}.uniq
  end

end
