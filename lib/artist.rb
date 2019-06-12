class Artist
  extend Concerns::Findable
  include Concerns::Savable

  @@all = []

  def self.all
    @@all
  end

  attr_accessor :songs, :name

  def initialize(name)
    super(name)
    @songs = []
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    self.songs.push(song) unless self.songs.include?(song)
    add_genre(song.genre) unless !song.genre || song.genre.artists.include?(self)
    song
  end

  def add_genre(genre)
    genre.artists.push(self) unless genre.artists.include?(self)
    genre
  end

  def genres
    Genre.all.select{|g| g.artists.include?(self)}
  end


end
