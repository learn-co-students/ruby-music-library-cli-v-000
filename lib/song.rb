class Song
  extend Concerns::Findable
  
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
    save
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

  def self.create(name, artist = nil, genre = nil)
    self.new(name, artist, genre)
  end

  def artist=(artist)
    @artist ||= artist
    if artist.class == Artist
      artist.add_song(self)
    end
  end

  def genre=(genre)
    @genre ||= genre
    if genre.class == Genre
      genre.add_song(self)
    end
  end

  def self.new_from_filename(filename)
    attributes = filename.split(" - ")
    
    artist_name, song_name, genre_name = attributes[0], attributes[1], attributes[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist_name)

    genre = Genre.find_or_create_by_name(genre_name)

    self.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end
end