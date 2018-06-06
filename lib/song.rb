 require 'pry'
class Song

  extend Concerns::Findable

  @@all = []
  attr_accessor :name
  attr_reader :artist, :genre

    def initialize(name, artist=nil, genre=nil)
      @name = name
      @artist = artist
      self.artist = artist if artist
      self.genre = genre if genre
      #binding.pry
    end

    def save
      @@all << self
    end

    def self.all
      @@all
    end

    def self.create(name)
      song = self.new(name)
      song.save
      song
    end

    def self.destroy_all
      @@all.clear
    end

    def artist=(artist)
      @artist = artist
      artist.add_song(self)
    end

    def genre=(genre)
      @genre = genre
      genre.songs << self unless genre.songs.include?(self)
    end

    def self.new_from_filename(filename)
      artist_name, song_name, genre_name = filename.split(" - ")[0], filename.split(" - ")[1], filename.split(" - ")[2].gsub(".mp3","")
      artist = Artist.find_or_create_by_name(artist_name)
      genre = Genre.find_or_create_by_name(genre_name)
      Song.new(song_name,artist,genre)
    end

    def self.create_from_filename(filename)
      new_from_filename(filename).save
    end

 end
