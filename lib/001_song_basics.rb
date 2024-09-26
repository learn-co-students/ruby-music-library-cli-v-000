require 'pry'
class Song
  extend Concerns::Findable

  @@all = []
  attr_accessor :name
  attr_reader :artist, :genre

  def initialize(name,artist=nil,genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
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

  def self.create(name,artist=nil,genre=nil)
    song = self.new(name)
 # note i probably don't need song.name = name since new already assigns name
    song.name = name
    song.artist = artist if artist
    song.genre = genre if genre

    @@all << song
    song
  end

  # def self.find_by_name(name)
  #   @@all.detect{|song| song.name == name  }
  # end
  #
  # def self.find_or_create_by_name(name)
  #   self.find_by_name(name) || name = self.create(name)
  # end

  def self.new_from_filename(file)

    song_name = file.split(" - ")[1]
    song_artist = file.split(" - ")[0]

    song_genre_mp3 = file.split(" - ")[2]
    song_genre = song_genre_mp3.split(".")[0]

    artist = Artist.find_or_create_by_name(song_artist)
    genre = Genre.find_or_create_by_name(song_genre)

    song = self.new(song_name,artist,genre)

    song

  end

  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    song.save
  end


end
