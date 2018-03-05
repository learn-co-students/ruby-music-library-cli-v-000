require 'pry'


class Genre

    attr_accessor :name, :songs
    @@all = []

    def initialize(name)
        @name = name
        @songs = []
        @@all = []
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
        genre = self.new(name) # This might be a issue "self" or "Class"
        genre.save
        genre
    end

    def add_song(song)
          if song.genre == nil
            song.genre = self
            #binding.pry
          end
          if !self.songs.include?(song)
              @songs << song
          end
    end

    def artists
        self.songs.collect{|s| s.artist}.uniq
    end
end
