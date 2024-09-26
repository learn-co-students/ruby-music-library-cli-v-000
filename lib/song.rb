require 'pry'

require_relative './concerns/findable.rb'

class Song

  attr_accessor :name, :artist, :genre

  extend Concerns::Findable

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
      if artist != nil
        self.artist=(artist)
      end
      if genre != nil
        self.genre=(genre)
      end
    @@all << self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def save
    @@all << self
  end

  def self.create(name)
    Song.new(name)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name) != nil
      find_by_name(name)
    else
      create(name)
    end
  end

  def self.new_from_filename(file)
    song_all = file.split('.')[0]
    file_artist = song_all.split(' - ')[0].strip
    file_name = song_all.split(' - ')[1].strip
    file_genre = song_all.split(' - ')[2].strip
    song = Song.new(file_name)
    song.artist = Artist.find_or_create_by_name(file_artist)
    song.genre = Genre.find_or_create_by_name(file_genre)
    song
  end

  def self.create_from_filename(file)
    new_from_filename(file)
  end

end
