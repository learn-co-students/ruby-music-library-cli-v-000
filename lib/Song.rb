require 'pry'

class Song

  attr_accessor :name
  attr_reader :artist, :genre

@@all = []

    def initialize (name, artist = nil, genre = nil)
      @name = name
      @genre = genre
      @@all
      self.artist = artist if artist
      self.genre = genre if genre
    end

    def genre= (genre)
      @genre = genre
      genre.songs << self unless genre.songs.include?(self)
    end

    def artist= (artist)
      @artist = artist
      artist.add_song(self)
    end

    def self.create(name)
      song = self.new(name)
      @@all << song
      song
    end


    def save
      @@all << self
    end


    def self.all
      @@all
    end

    def self.destroy_all
      @@all.clear
    end


    def self.find_by_name(name)

    end

end
