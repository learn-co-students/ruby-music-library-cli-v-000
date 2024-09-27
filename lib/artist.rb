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

  def add_song(song)
    @songs << song unless self.songs.include?(song)
    song.artist = self unless song.artist
  end

  def genres
    self.songs.collect { |song| song.genre }.uniq
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def self.destroy_all
    @@all.clear
  end

end
