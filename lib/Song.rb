require_relative '../concerns/music_module'
require 'pry'
class Song < Music
  attr_reader :artist, :genre
  attr_accessor :genre
  extend Concerns::Findable
  @@all_songs = []
  def initialize(name, artist=nil, genre=nil)
    @name=name
    self.artist=artist if artist
    self.genre=genre if genre
    # artist.add_song(self)
    # genre.add_song(self)
    # @@all<< self
  end
  def self.create(name, artist=nil, genre=nil)
    self.new(name, artist, genre).tap{|s| s.save}
  end

  def self.new_from_filename(file_name)
    song_name = file_name.split(" - ")[1]
artist_name=file_name.split(" - ")[0]
song_genre_name=file_name.split(' - ')[2].chomp('.mp3')
song= Song.new(song_name, Artist.find_or_create_by_name(artist_name),Genre.find_or_create_by_name(song_genre_name))
    song

  end

  def self.create_from_filename(file_name)
    song_name = file_name.split(" - ")[1]

    # song=Song.new(song_name)
    artist_name=file_name.split(" - ")[0]
    # song_artist=Artist.find_or_create_by_name(artist_name)
    # song.artist=song_artist
    # song_artist.add_song(song)
    song_genre_name=file_name.split(' - ')[2].chomp('.mp3')
    # song_genre=Genre.find_or_create_by_name(song_genre_name)
    # song_genre.add_song(song)
    artist=Artist.find_or_create_by_name(artist_name)
    genre=Genre.find_or_create_by_name(song_genre_name)
    song= Song.create(song_name, artist, genre)

  end


  # def self.find_by_name(name)
  #   @@all.find {|song| song.name == name }
  # end
  #
  # def self.find_or_create_by_name(name)
  #   if self.find_by_name(name) == nil
  #     Song.new(name)
  #   else self.find_by_name(name)
  #   end
  # end

  def artist=(artist)
    @artist=artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre=genre
    genre.add_song(self)
  end

  def save
    @@all_songs << self
  end

  def self.destroy_all
    @@all_songs=[]
  end

  def self.all
    @@all_songs
  end
end
