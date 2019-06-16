class Artist < Base

  attr_reader :songs, :genre

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
    self
  end

  def self.create(name)
    new(name).save
  end

  def add_song(song)
      song.artist = self unless song.artist
      self.songs << song unless self.songs.include?(song)
      song
    end

    def genres
      songs.collect{ |song| song.genre }.uniq
    end

end
