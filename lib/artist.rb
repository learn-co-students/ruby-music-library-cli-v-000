class Artist
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs
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
    # self.class.all << self
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
    # new(name).tap{ |a| a.save }
  end

  def add_song(song)
    #only add song if not already there
    song.artist = self unless song.artist
    @songs << song unless songs.include?(song)
  end

  def genres
    #.uniq does not return duplicate genres
    @songs.map{ |song| song.genre }.uniq
  end

end
