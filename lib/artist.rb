class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @songs = []

    @name = name
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    return artist
  end

  def add_song(song)
    if song.artist != self
      song.artist = self
    end
    if self.songs.include?(song) == false
      self.songs << song
    end
  end

  def genres
    songs.collect{|song| song.genre}.uniq
  end

end
