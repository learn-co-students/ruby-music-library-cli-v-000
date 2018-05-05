class Artist
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs
  @@all = []

  def initialize(name)
    self.name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    Artist.all << self
  end

  def self.destroy_all
    Artist.all.clear
  end

  def self.create(name)
    Artist.new(name).tap {|artist| artist.save}
  end

  def add_song(song)
    song.artist ||= self
    self.songs << song unless self.songs.include?(song)
  end

  def genres
    self.songs.map {|song| song.genre}.uniq
  end
end
