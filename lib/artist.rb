require_relative "./song.rb"
require 'pry'

class Artist

    extend Concerns::Findable
    attr_accessor :name, :songs
    @@all = []


    def initialize(name)
      @name = name
      @songs = []
    end

    def genres
      genres = self.songs.collect {|song| song.genre}
      genres.uniq
    end


    #do i really get this, can i re write this as an if statement?
    def add_song(song)
        song.artist = self unless song.artist
        @songs << song unless @songs.include?(song)
    end

    def songs
      @songs
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

    def self.create(artist)
      artist = self.new(artist)
      artist.save
      artist
    end
  end
