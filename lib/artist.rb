class Artist
  extend Concerns::Findable

  attr_accessor :name, :song

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
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

  def add_song(song)
    song.artist = self unless song.artist == self
    self.songs << song unless self.songs.include?(song)
  end

  def songs
    @songs
  end

  def genres
    self.songs.map do |song|
      song.genre
    end.uniq
  end

  def self.find_by_name(name)
    self.all.detect {|artist| artist.name == name}
  end
end
