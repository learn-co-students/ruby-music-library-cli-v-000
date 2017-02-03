

class Song
  extend Concerns::Findable

  @@songs = []
  attr_accessor :name
  attr_reader :artist, :genre

  def initialize (name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) unless artist == nil
    self.genre=(genre) unless genre == nil
    self.save
  end

  def self.all
    @@songs
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    self.new(name)
  end

  def self.new_from_filename(filename)
    artist, name, genre = filename.split(" - ")
    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(genre.delete(".mp3"))
    self.new(name, artist, genre)
  end


  def self.create_from_filename(filename)
    artist, name, genre = filename.split(" - ")
    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(genre.split(".").first)
    self.new(name, artist, genre)
  end

  def save
    @@songs << self
  end


  #BELONGS TO

  def artist=(artist)
    if artist.class != Artist
      raise ArtistError
    else
      @artist = artist
      artist.add_song(self) unless artist.songs.include?(self)
    end
  end

  def genre=(genre)
    if genre.class != Genre
      raise GenreError
    else
      @genre = genre
      genre.add_song(self) unless genre.songs.include?(self)
    end
  end

  class ArtistError < StandardError
    def message
      "You must provide the artist method an instance of the Artist class"
    end
  end

  class GenreError < StandardError
    def message
      "You must provide the genre method an instance of the Genre class"
    end
  end
end
