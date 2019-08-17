require_relative './artist.rb'
require_relative '../concerns/findable.rb'

class Song

extend Concerns::Findable

@@all = []

  attr_accessor :name
  attr_reader :artist, :genre

  def initialize(name, artist = nil, genre = nil)
    self.name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    Song.all << self
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
    @genre = genre
    if !genre.songs.include?(self)
      genre.add_song(self)
    end
  end


  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

  def self.new_from_filename(file_name)
    info = file_name.split(" - ")
    song_name = info[1]
    gfix = info[2].gsub(".mp3", "")
    artist_name = Artist.find_or_create_by_name(info[0])
    genre_name = Genre.find_or_create_by_name(gfix)

    Song.new(song_name, artist_name, genre_name)
  end

  def self.create_from_filename(file_name)
    new_from_filename(file_name).save
  end


end
