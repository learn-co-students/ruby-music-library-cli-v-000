require 'pry'

class Song

  attr_accessor :name, :artist, :genre

  @@all = []

  def self.all
    @@all
  end

  def self.find_by_name(song_name)
    # detect stops on the first thing it finds that matches the condition and returns that value
    self.all.detect do |song|
      song.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil #if the song isn't in there
        self.create(song_name)              #make a new song
    else self.find_by_name(song_name) != nil #if the song is in there
      self.find_by_name(song_name)            # find it and return it
    end
  end

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    @genre.songs << self unless @genre.songs.include?(self)
  end

  def self.new_from_filename(filename)

    parts = filename.split(" - ")
    song_name = parts[1]
    song_artist = parts[0]
    song_genre = parts[2].gsub(/[.](mp3)/, "")

    song_artist = Artist.find_or_create_by_name(song_artist)
    song_genre = Genre.find_or_create_by_name(song_genre)
    Song.new(song_name, song_artist, song_genre)

  end

  def self.create_from_filename(filename)
    Song.new_from_filename(filename).save
  end

end
