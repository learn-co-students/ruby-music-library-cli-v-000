class Artist

  extend Concerns::Findable

  attr_accessor :name, :songs
  attr_writer :genres

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
    artist = Artist.new(name)
    artist.save
    artist
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end

  def genres
    self.songs.collect{|s| s.genre}.uniq
  end
end
