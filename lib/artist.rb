class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

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
    self.new(name).tap { |artist| artist.save }
  end

  def songs
    @songs
  end

  def add_song(song)
    song.artist = self unless song.artist == self #tells the song it belongs to the artist unless it's already there
    @songs << song unless @songs.include?(song) #adds a song to the collection unless the song already belongs to an artist
  end

  def genres
    self.songs.collect {|s| s.genre}.uniq
  end

end
