class Artist
  attr_accessor :name, :genre, :songs

  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    new_artist = Artist.new(name)
    new_artist.save
    new_artist
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist == self
  end

  def genres
    songs.collect {|song| song.genre}.uniq
  end

end
