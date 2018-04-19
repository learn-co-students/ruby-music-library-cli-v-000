require_relative "./music_module.rb"

class Song
  extend Music::C_Methods
  include Music::I_Methods

  attr_reader :artist, :genre

  @@all = []

  def self.find_by_name(name)
    arr = self.all
    rtn = arr.detect { |e| e.name == name}
    rtn
  end

  def self.find_or_create_by_name(name)
    rtn = self.find_by_name(name)
    if !!rtn
      return rtn
    else
      self.create(name)
    end
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end

  def self.new_from_filename(filename)
    arr = filename.split(' - ')

    genre_name = arr[2].slice(0, (arr[2].length - 4)).strip
    artist_name = arr[0].strip
    song_name = arr[1].strip

    genre = Genre.find_or_create_by_name(genre_name)
    artist = Artist.find_or_create_by_name(artist_name)
    song = Song.new(song_name, artist, genre)
    song
  end

  def initialize(name, artist = nil, genre = nil)
    super(name)

    self.genre = genre if !! genre
    self.artist = artist if !!artist
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

end
