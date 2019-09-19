class Artist
  extend Concerns::Findable
  attr_accessor :name

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def add_song(song)
    song.artist = self unless song.artist
    self.songs << song unless self.songs.include?(song)
  end

  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    Artist.new(name).tap do |artist|
      artist.save
    end
  end

  def genres
    songs.collect { |s| s.genre }.uniq
  end

end
