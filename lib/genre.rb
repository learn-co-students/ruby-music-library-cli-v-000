class Genre

  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = Array.new

  def initialize(name)
    @name = name
    self.save
    @songs = Array.new
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    new(name)
  end

  def save
    self.class.all << self
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.genre = self unless song.genre != nil
  end

  def artists
    artists = self.songs.collect { |song| song.artist }
    artists.uniq
  end
end
