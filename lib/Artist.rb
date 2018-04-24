require "pry"
class Artist
  extend Concerns::Findable

  attr_accessor :name, :song, :genre

@@all = []

    def initialize(name)
      @name = name
      @songs = []
      @@all
    end

    def self.create(name)
      artist = self.new(name)
      @@all << artist
      artist
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

    def add_song (song)
      song.artist = self unless song.artist
      @songs << song unless @songs.include?(song)
    end

    def songs
      @songs
    end

    def genres
      songs.collect(&:genre).uniq
    end


end
