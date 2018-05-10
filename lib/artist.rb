class Artist

  extend Concerns::Findable

  @@all = []
  attr_accessor :name
  attr_reader :songs
  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def genres
    genres = self.songs.collect {|song| song.genre }
    genres.uniq
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self if song.artist != self
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
    song = new(name)
    song.save
    song
  end
#----Associations:

end
