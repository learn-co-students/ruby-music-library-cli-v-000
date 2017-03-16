class Artist

  attr_accessor :name, :genres, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @genres = []
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
    artist
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end

  def add_genre(song)
    song.genre = self unless song.genre == self
    @genres << song.genre unless @genres.include?(song.genre)
  end
end
