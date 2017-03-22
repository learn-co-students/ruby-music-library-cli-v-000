class Artist
# attributes, variables, modules
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

# initialize
  def initialize(name)
    @name = name
    @songs = []
  end

# class methods
  def self.all
    @@all
  end

  def self.count
    @@all.size
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

# instance methods
  def save
    @@all << self
  end

  def add_song(song)
    unless @songs.include?(song)
      @songs << song
    unless song.artist == self
      song.artist = self
    end
  end
  end

  def genres
    self.songs.map {|song| song.genre}.uniq
  end

end
