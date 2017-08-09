class Artist
  extend Concerns::Findable
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all.uniq
  end

  def save
    @@all << self unless @@all.include?(self)
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(artist)
    new_artist = Artist.new(artist)
    new_artist.save
    new_artist
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self if song.artist.nil?
  end

  def songs
    @songs
  end

  def genres
    songs.map {|song| song.genre}.uniq
  end

end
