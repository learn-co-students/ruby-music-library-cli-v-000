require_relative '../lib/concerns/findable.rb'

class Artist

extend Concerns::Findable

  attr_accessor :name, :songs, :song, :genres, :genre, :genres_collection, :artist

  @@all = []

    def initialize(name)
      @name = name
      #@artist = self
      @songs = []
      @genres_collection = []
      save
    end

    def self.all
      @@all
    end

    def save
      @@all << self
    end

    def self.create(name)
      if find_by_name(name)
        find_by_name(name)
      else
        Artist.new(name)
      end
    end

    def add_song(song)
      if @songs.include?(song) == false
        @songs << song
      end
      if song.artist != self
        song.artist = self
      end
    end

    def self.destroy_all
      self.all.clear
    end

    def genres
      @genres_collection
    end

end
