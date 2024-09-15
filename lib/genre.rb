class Genre
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre, :songs

  @@all = Array.new

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @songs = Array.new
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = Array.new
  end

  def save
    self.class.all << self
  end

  def self.create(name, artist = nil, genre = nil)
    new(name, artist, genre).tap{|song| song.save}
  end

  def add_song(song)
    song.genre = self unless song.genre == self
    @songs << song unless @songs.include?(song)
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end
end
