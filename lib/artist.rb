class Artist
  extend Concerns::Findable
  attr_accessor :name, :song, :genre

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
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

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self if song.artist == nil
  end


  def self.create(name)
    new_artist = self.new(name)
    new_artist.save
    new_artist
  end

  def genres
    self.songs.collect{|song| song.genre}.uniq
  end

end
