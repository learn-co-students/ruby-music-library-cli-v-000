class Artist
  attr_accessor :name, :songs
  extend Concerns::Findable
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    #@songs << song unless @songs.detect{ |x| x = song}
    @songs << song unless songs.include?(song)
    song.artist = self unless song.artist == self
  end

  def genres
    self.songs.collect {|x| x.genre}.uniq
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

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end
end
