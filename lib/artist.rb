class Artist
  extend Concerns::Findable
  attr_accessor :name 

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
    @@all << self
  end

  def self.create(artist)
    new_artist = self.new(artist)
    new_artist.save
    new_artist
  end

  def add_song(song)
    songs << song unless songs.include?(song)
    song.artist || song.artist = self
  end

  def songs
    @songs
  end

  def genres
    songs.map {|song| song.genre}.uniq
  end

end

