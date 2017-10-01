require 'pry'

class Song

   extend Concerns::Findable

    attr_accessor :name, :artist, :genre

    @@all = []

    def initialize(name, artist = nil, genre = nil)
      @name = name
      @artist = artist
      self.artist = artist if artist
      self.genre = genre if genre
    end

    def self.all
      @@all
    end

    def self.destroy_all
      self.all.clear
    end

    def save
      @@all << self
    end

    def artist=(artist)
      @artist = artist
      artist.add_song(self)
    end

    def genre=(genre)
      @genre = genre
      genre.songs << self unless genre.songs.include?(self)
    end

    def self.new_from_filename(filename) #initializes a song based on the passed-in filename
      artist, name, genre = filename.gsub(".mp3", "").split(" - ")
      song = self.new(name)
      song.artist = Artist.find_or_create_by_name(artist)
      song.genre = Genre.find_or_create_by_name(genre)
      song
    end

    def self.create_from_filename(filename) #initializes & saves the newly-created song based on the passed-in filename
      artist, name, genre = filename.gsub(".mp3", "").split(" - ")
      song = self.new_from_filename(filename)
      song.save
    end

end
