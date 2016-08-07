class Artist

  extend Concerns::Findable

  attr_accessor :name,  :songs

@@all = []

  def initialize(name, artist = nil, genre = nil)
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

  def self.create(song)
    new(song).tap{|s| s.save}
  end

  def add_song(song)
     song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end

  def genres
    self.songs.collect {|s| s.genre}.uniq
  end

  def to_s
    self.name
  end
  
  end
