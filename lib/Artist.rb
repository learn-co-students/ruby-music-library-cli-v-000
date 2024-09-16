class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def songs
    @songs
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    self.songs << song unless self.songs.include?(song)
  end

  def genres
   self.songs.collect {|song| song.genre}.uniq
  end

end
