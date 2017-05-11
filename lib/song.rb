class Song
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre
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

  def self.create(name = nil)
    temp = self.new(name)
    @@all << temp
    temp
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    @genre.add_song(self)
  end


  def self.new_from_filename(filename)
    doc = filename.split(" - ")
    name = doc[1]
    artist_name = doc[0]
    genre1 = doc[2].split(".")
    genre_name = genre1[0]
    song = Song.find_or_create_by_name(name)
    artist = Artist.find_or_create_by_name(artist_name)
    artist.add_song(song)
    genre = Genre.find_or_create_by_name(genre_name)
    genre.add_song(song)
    song
  end

  def self.create_from_filename(filename)
     song = Song.new_from_filename(filename)
  end




end
