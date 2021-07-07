class Artist
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def self.all
    @@all
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def add_song(song)
    if song.artist == self
      song
    else
      song.artist = self
    end
    if self.songs.detect {|song_in_array| song_in_array == song}
      song
    else
      self.songs << song
    end
    song
  end

  def genres
    songs.collect do |song|
      song.genre
    end.uniq
  end
end
