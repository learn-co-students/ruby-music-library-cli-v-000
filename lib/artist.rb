require 'pry'

class Artist
  extend Concerns::Findable
    attr_accessor :name, :song
    @@all = []

    def initialize(name)
      @name = name
      @songs = []
      save
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

    def self.create(name)
      artist = new(name)
      artist.save
      artist
    end

    def songs
      @songs
    end

    def add_song(song)
      song.artist = self if song.artist.nil?
      self.songs << song unless self.songs.include?(song)
      #binding.pry
    end

    def genres
      genres = self.songs.collect do |song|
        song.genre
     end
     genres.uniq
   end

  end
