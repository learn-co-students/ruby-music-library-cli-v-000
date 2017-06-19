require_relative "../concerns/modules.rb"

class Song
  @@all = []
  attr_accessor :name, :artist, :genre
  extend Concerns::Findable
  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      @artist = artist
      artist.add_song(self) unless artist.songs.include?(self)
    end
    if genre != nil
      @genre = genre
      genre.add_song(self) unless genre.songs.include?(self)
    end
  end

  def artist=(artist)
    artist.add_song(self) unless artist.songs.include?(self)
    @artist = artist
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
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
    song = self.new(name)
    song.save
    song
  end

end
