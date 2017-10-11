require 'pry'

class Artist
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :song
  @@all = []

    def initialize(name)
      @name = name
      @songs = []
    end

    def songs
      @songs
    end

    def add_song(song)
      song.artist = self unless song.artist
      songs<<song unless songs.include?(song)
    end
    
    def genres
      @genres = self.songs.collect do |song|
        song.genre
      end
      @genres = @genres.uniq
    end


    def self.all # class reader
      @@all
    end

    def save
      @@all << self
    end

    def self.destroy_all
      @@all.clear
    end

    #def self.create(name)
    #  artist = Artist.new(name)
    #  artist.save
    #  artist
    #end

end
