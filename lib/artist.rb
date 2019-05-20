class Artist
  attr_accessor :name
  attr_reader :songs
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

  def self.create(artist)
    new_artist = self.new(artist)
    new_artist.save
    new_artist
  end

  def add_song(song)
    self.songs << song unless self.songs.include?(song)
    song.artist ||= self
  end

  def genres
    self.songs.map {|song| song.genre}.uniq
  end
end
