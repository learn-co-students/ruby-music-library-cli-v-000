class Artist

  extend Concerns::Findable

  attr_accessor :name, :songs

@@all = []

  def initialize(name, artist = nil)
    @name = name
    @songs = []
  end

  def songs
    @songs
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

  def self.create(artist)
    artist = Artist.new(artist)
    @@all << artist
    artist
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist == self
  end

  def genres
   self.songs.collect {|s| s.genre}.uniq
 end
end
