class Artist
  extend Concerns::Findable
  attr_accessor :name, :song, :genre

  @@all = []

  def initialize(name)
    @name = name
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

  def self.create(name)
    song = Artist.new(name).save.last
  end

  def songs
    @songs
  end

  def add_song(song)
    song.artist = self unless song.artist != nil
    self.songs << song unless self.songs.include?(song)
  end

  def genres
    self.songs.collect{|s| s.genre}.uniq
  end

end
