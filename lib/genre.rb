class Genre

  #accepts a name upon initialization and set that property
  #name property should be readable and writable by object

  attr_accessor :name
  attr_reader :artist

  @@all = []

  def initialize(name)
    @name = name
    # @artist = artist if artist
    @songs = []
  end

  def songs
    @songs
  end

  def artists
    songs.collect {|s| s.artist}.uniq
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    all.clear
  end

  def self.create(name)
    artist = new(name)
    artist.save
    artist

  end

end
