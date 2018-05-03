require 'pry'

class Song
  attr_accessor :name

  @@all = []

  # Instance Methods

  def initialize(name, artist_invoked = false, genre_invoked = false)
    @name = name
    if artist_invoked != false
      self.artist = artist_invoked
    end
    if genre_invoked != false
      self.genre = genre_invoked
    end
  end

  def save
    @@all << self
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def artist
    @artist
  end

  def genre=(genre)
    @genre = genre
    if @genre.songs.include?(self) == false
      @genre.songs << self
    end
  end

  def genre
    @genre
  end

  # Class Methods

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    new_song = Song.new(name)
    @name = name
    @@all << new_song
    new_song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create(name)
    end
  end

#binding.pry

  def self.new_from_filename(filename)
    song = self.new(filename.split(" - ")[1])
    song_artist_name = filename.split(" - ")[0]
    song_genre_name_with_mp3 = filename.split(" - ")[2]
    song_genre_name = song_genre_name_with_mp3.split(".")[0]
    song_artist = Artist.find_or_create_by_name(song_artist_name)
    song.artist = song_artist
    song_genre = Genre.find_or_create_by_name(song_genre_name)
    song.genre = song_genre
    song
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    new_song.save
    new_song
  end
end
