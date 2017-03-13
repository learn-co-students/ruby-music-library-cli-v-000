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

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    self.new(name).tap {|artist| artist.save}
  end

  def add_song(song)
    self.songs << song if !(self.songs.include?(song))
    song.artist = self if song.artist.nil?
  end

  def genres
    self.songs.map {|song| song.genre}.uniq
  end
end
