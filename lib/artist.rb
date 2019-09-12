class Artist
  extend Concerns::Findable
  attr_accessor :name
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
  end
  def genres
    self.songs.map {|s| s.genre}.uniq
  end
  def songs
    @songs
  end
  def add_song(song)
    song.artist = self if song.artist == nil
    @songs = @songs.tap {|songs| songs << song} if !@songs.include?(song)
  end
  def self.all
    @@all
  end
  def self.destroy_all
    @@all = []
  end
  def save
    @@all << self
  end
  def self.create(name)
    self.new(name).tap {|new_art| new_art.save}
  end
end
