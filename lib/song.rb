require 'pry'


class Song
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist=Artist.new("unknown"), genre=Genre.new("unknown"))
    @name = name
    self.artist= artist
    self.genre = genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def save
    @@all << self
  end

  def genre=(genre)
    @genre = genre
    if genre.songs.include?(self) == false
      genre.songs << self
    end
  end

  def new_from_filename(filename)

  end

  def create_from_filename(filename)
    new_from_filename(filename)
    save #need to maintain uniqueness
  end

end

























