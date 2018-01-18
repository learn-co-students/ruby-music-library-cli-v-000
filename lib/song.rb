require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist, :genre
  extend Concerns::Findable

  @@all = []

  def initialize(n, a = :unknown, g = :unknown)
    @name = n
    if a === :unknown
      @artist = :unknown
    else
      self.artist=a
    end
    if g === :unknown
      @genre = :unknown
    else
      self.genre=g
    end
  end

  def artist=(a)
    @artist = a
    a.add_song(self)
  end

  def genre=(g)
    @genre = g
    if !(g.songs.include?(self))
      g.songs << self
    end
  end

  def save
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  # ARTIST, NAME, GENRE.mp3
  def self.new_from_filename(fn)
    nfn = fn.split(" - ")
    artist = Artist.find_or_create_by_name(nfn[0])
    genre = Genre.find_or_create_by_name(nfn[2].chomp(".mp3"))
    name = Song.new(nfn[1], artist, genre)
  end

  def self.create_from_filename(fn)
    song = self.new_from_filename(fn)
    song.save
  end
end
