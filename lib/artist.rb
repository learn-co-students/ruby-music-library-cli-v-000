class Artist
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

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
    song = Artist.new(name)
    song.save
    song
  end

  def add_song(song)
    songs << song if !songs.include?(song)
    song.artist = self if song.artist.nil?
  end

  def genres
    songs.map{|song| song.genre}.uniq
  end

end