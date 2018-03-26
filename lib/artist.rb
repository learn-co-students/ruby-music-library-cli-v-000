require 'pry'


class Artist

  extend Concerns::Findable

    attr_accessor :name, :songs
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

    def genres
      self.songs.collect {|song| song.genre}.uniq
    end

  end
