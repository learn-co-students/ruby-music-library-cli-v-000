class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    artist = new(name)
    artist.save
    artist
  end

  def self.destroy_all 
    @@all.clear
  end

  def self.all
    @@all
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end

  def save
    @@all << self
  end

  def genres
    self.songs.collect{|s| s.genre}.uniq
  end

end


