class Artist
  extend Concerns::Findable

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def name
    @name.dup.freeze
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    x = Artist.new(name)
    x.save
    x
  end

  def songs
    @songs
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless songs.detect {|x| x == song}
  end

  def genres
    self.songs.map {|x| x.genre}.uniq
  end
end
