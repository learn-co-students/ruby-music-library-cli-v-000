class Genre
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    self.new(name).save
  end

  def initialize(name)
    self.name = name
    @songs = []
  end

  def save
    self.class.all << self unless self.class.all.include?(self)
    self
  end

  def add_song(song)
    self.songs << song if song.is_a?(Song) && !self.songs.include?(song)
    song.genre = self if song.genre != self
  end

  def artists
    artists = self.songs.map { |song| song.artist }
    artists.uniq
  end
end
