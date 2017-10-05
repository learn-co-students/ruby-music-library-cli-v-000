class Artist
  extend Concerns::Findable

  attr_accessor :name, :genre
  attr_reader :songs
  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def save
    self.class.all << self
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    songs << song unless songs.include?(song)
    song.artist = self unless song.artist
  end

  def genres
    genres = songs.collect {|song| song.genre}
    genres.uniq
  end

end
