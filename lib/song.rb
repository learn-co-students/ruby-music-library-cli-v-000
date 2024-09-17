require 'pry'

class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre

  @@all=[]

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre

  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name, artist = nil, genre = nil)

    song = self.new(name, artist, genre)
    song.save
    song
  end

  def save
    @@all << self
  end


  def artist=(artist)
    @artist = artist if artist != nil
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def Song.new_from_filename(file)
    Song.create_from_filename(file)
  end

  def Song.create_from_filename(file)
    normalized = file.split(" - ")
    normalized_artist = normalized[0]
    normalized_name = normalized[1]
    normalized_genre = normalized[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(normalized_artist)
    genre = Genre.find_or_create_by_name(normalized_genre)
    self.create(normalized_name, artist, genre)
  end
end
