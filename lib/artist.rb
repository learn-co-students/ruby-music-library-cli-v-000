class Artist

  extend Concerns::Findable

  attr_accessor :name, :song, :artist, :genre

  @@all = []

  def initialize(name)
    @name=name
    @artist=artist
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(artist_name)
    artist = self.new(artist_name)
    artist.save
    artist
  end

  def songs
    @songs
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    end
    @songs << song unless @songs.include?(song)
  end

  def genres(song=nil)
      self.songs.collect { |song| song.genre }.uniq
  end




end #class
