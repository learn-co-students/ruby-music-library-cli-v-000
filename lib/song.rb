require 'pry'
class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre
  @@all = []


  def initialize(name, artist= nil, genre= nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.all
    @@all
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if genre.songs.detect {|s|s == self }
      return nil
    else
      genre.songs << self
    end
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    new(name).tap {|n|n.save}
  end

  def self.new_from_filename(filename)
    array = filename.split(" - ")
    artist_name = array[0]
    artist = Artist.find_or_create_by_name(artist_name)
    genre_name = array[2].chomp('.mp3')
    genre = Genre.find_or_create_by_name(genre_name)
    song_title = array[1]
    song = Song.new(song_title, artist, genre)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

end
