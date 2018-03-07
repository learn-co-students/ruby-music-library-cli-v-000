require 'pry'

class Artist
    attr_accessor :name
    @@all = []

    def initialize(name)
      @name = name
      @songs = []
    end

    def songs
      @songs
    end

    def add_song(song)
      if song.artist != self
        song.artist = self
      end
      if @songs.include?(song) == false
        @songs << song
      end
      # song.artist = self unless song.artist == self
      # @songs << song unless @songs.include?(self)
    end



    def self.all
      @@all
    end

    def self.destroy_all
      @@all = []
    end

    def save
      @@all << self
    end

    def self.create(name)
      artist = Artist.new(name)
      artist.save
      artist
    end

  end
