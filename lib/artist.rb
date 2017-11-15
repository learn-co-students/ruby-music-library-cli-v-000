class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    self.save
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = self.new(name)
  end

  def self.destroy_all
    self.all.clear
  end

  def add_song(song)
    self.songs << song unless self.songs.include?(song) # add song to list if not already there
    song.artist = self unless song.artist # set song's artist if not already set
  end

  def genres
    g = self.songs.collect{ |song| song.genre }
    g.uniq
  end

end
