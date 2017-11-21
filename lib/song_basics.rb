require 'pry'
class Song
  attr_accessor :name
  attr_reader :artist, :genre
  extend Concerns::Findable

  def initialize(name, artist= nil, genre= nil)
    @name = name
    if artist != nil
      self.artist = artist
    end
    if genre != nil
      self.genre = genre
    end
  end

  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    thing= self.new(name)
    thing.save
    thing
  end

  def artist= (artist)
    @artist = artist
    @artist.songs.include?(self) ? "This song is already recorded" : @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    @genre.songs.include?(self) ? "This song is already part of the genre" : @genre.songs << self
  end

  def self.new_from_filename(file)
    song_attributes = file.chomp(".mp3").split(" - ")
    song_name = song_attributes[1]
    artist_name = song_attributes[0]
    genre_name = song_attributes[2]
    if self.find_by_name(song_name) == nil
      song = Song.new(song_name)
    else
      song = self.find_by_name(song_name)
    end
    song.artist = Artist.find_or_create_by_name(artist_name)
    song.genre = Genre.find_or_create_by_name(genre_name)
    song
  end

  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    song.save
    song
  end


end
