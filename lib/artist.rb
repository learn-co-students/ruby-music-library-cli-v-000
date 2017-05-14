class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    a = self.new(name)
    @@all << a
    a
  end

  def save
    @@all << self
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end

  def genres
    self.songs.collect{|s| s.genre}.uniq
  end

  def self.destroy_all
    @@all.clear
  end

  def self.count
    @@all.size
  end


end
