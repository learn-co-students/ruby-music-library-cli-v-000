require 'pry'
class Song

  @@all = []

  attr_accessor :name, :artist, :genre

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist=artist
    end
    if genre != nil
      self.genre=genre
    end
  end

  def self.create(name)
    new_song = Song.new(name)
    new_song.save
  end

  def save
    @@all << self
    self
    #binding.pry
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

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.find_by_name(name)

    @@all.find{|song| song.name==name}

  end

  def self.find_or_create_by_name(name)

    song = self.find_by_name(name)
    if  song == nil
      song=self.create(name)
    end
    song

  end

  def self.new_from_filename(filename)
    artist_name, song_name, genre_name = filename.split(" - ")
    genre_name = genre_name.split(".")[0]
    new_artist = Artist.find_or_create_by_name(artist_name)
    new_genre = Genre.find_or_create_by_name(genre_name)
    new_song = self.new(song_name, new_artist, new_genre)
    new_song
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    @@all << new_song
  end



end
