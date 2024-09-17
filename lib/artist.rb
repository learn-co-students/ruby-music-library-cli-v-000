class Artist
  attr_accessor :name
  attr_reader :songs
  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
      @songs << song unless @songs.include?(song)
      song.artist = self unless song.artist
  end

  def genres
    @songs.collect {|song| song.genre}.uniq
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
    artist = new(name)
    artist.save
    artist
  end
end
