class Artist
  extend Concerns::Findable
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
    if song.artist != nil
      artist = song.artist
    else
      artist = self
    end
    if song.artist != artist
      song.artist = artist
    end
    if artist.songs.include?(song)
      return
    else
      artist.songs << song
    end
  end

  def genres
    array = self.songs.collect{|song|song.genre}
    array.uniq!
    array
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

end
