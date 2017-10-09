require 'pry'
class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    artist != nil ? artist.add_song(self)  : nil
    genre != nil ? self.genre = genre : nil
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(song)
    new_song = Song.new(song)
    new_song.save
    new_song
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    detected_song = @genre.songs.detect{|saved_song| saved_song.name == @name }
    detected_song == nil ? @genre.songs << self : nil
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    new_name = nil
    new_name = find_by_name(name)
    new_name == nil ? self.create(name) : new_name
  end

  def self.new_from_filename(file_name)
    song_name = file_name.match(/- .+ -/).to_s
    song_name.slice!("- ")
    song_name.slice!(" -")
    artist_name = file_name.match(/^([^-]+)\w/).to_s
    genre_name = file_name.match(/- [a-z].+/).to_s
    genre_name.slice!("- ")
    genre_name.slice!(".mp3")
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    Song.new(song_name,artist,genre)
  end

  def self.create_from_filename(file_name)
    new_song = new_from_filename(file_name)
    new_song.save
  end

end
