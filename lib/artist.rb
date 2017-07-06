class Artist
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def add_song(song)
    song.artist = self if song.artist == nil
    songs << song unless songs.include?(song)
  end

  def genres
    songs.collect {|song| song.genre}.uniq
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    self.new(name).tap {|artist| artist.save}
  end
end
