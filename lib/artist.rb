class Artist
  attr_accessor :name, :songs, :genres
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @genres = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    self.new(name).save
    self
  end
  #### Unique Methods ######

  def add_song(song)
    self.songs.include?(song) || @songs << song
    song.artist || song.artist = self
    self.genres << song.genre
    binding.pry
  end

end
