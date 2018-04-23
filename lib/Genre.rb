require "pry"
class Genre

  attr_accessor :name, :artist, :song

@@all = []

    def initialize(name)
      @name = name
      @@all
      @songs = []
    end

    def self.create(name)
      genre = self.new(name)
      @@all << genre
      genre
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

    def songs
      @songs
    end

    def artists
      songs.collect(&:artist).uniq
    end



end
