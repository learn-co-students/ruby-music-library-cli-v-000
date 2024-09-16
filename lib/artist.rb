class Artist
  @@all = []
  extend Concerns::Findable
  attr_accessor :name, :songs
  def initialize(name)
    @name = name
    @songs = []
  end
  def self.all
    @@all
  end
  def add_song(song)
    song.artist = self unless song.artist
    self.songs << song unless self.songs.include?(song)
  end
  def self.destroy_all
    self.all.clear
  end
  def save
    self.class.all << self
  end
  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end
  def genres
    self.songs.collect {|song|song.genre}.uniq
  end
end
