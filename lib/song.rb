require 'pry'
class Song
  attr_accessor :name, :artist
  attr_reader :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist = artist
    end
    if genre != nil
      self.genre = genre
    end
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
    song = Song.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    genre.songs << self unless genre.songs.include?(self)
    @genre = genre
  end

  def self.find_by_name(song)
    found_array = @@all.detect {|x| x.name == song}
    found_array
  end

  def self.find_or_create_by_name(song)
    find_by_name(song) || Song.create(song)
  end

end
