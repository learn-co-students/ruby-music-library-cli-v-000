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

  def self.all
    @@all
  end

  def self.create(artist)
    newartist = Artist.new(artist)
    newartist.save
    newartist
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    if song.artist != self
      song.artist = self
    end
  end

  def genres
    genres = []
    self.songs.each do|song|
      genres << song.genre
    end
    genres.uniq
  end

  def self.destroy_all
    @@all.clear
  end
end
