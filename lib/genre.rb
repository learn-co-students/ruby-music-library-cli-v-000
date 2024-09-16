class Genre

  extend Concerns::Findable

  @@all = []
  attr_accessor :name
  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self if song.artist != self
  end

  def artists
    artists = self.songs.collect {|song| song.artist }
    artists.uniq
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
