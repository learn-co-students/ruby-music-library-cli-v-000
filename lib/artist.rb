class Artist
  attr_accessor :name
  attr_reader :songs
  @@all = []

  extend Concerns::Findable

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
    @@all << self
  end

  def self.create(name)
    Artist.new(name).tap {|artist| artist.save}
  end

  def add_song(song)
     song.artist = self unless song.artist
     self.songs << song unless self.songs.include?(song)
  end

  def genres
    self.songs.map { |s| s.genre }.uniq
  end
end
