require 'pry'

class Artist
    extend Concerns::Findable
    extend Persistable::ClassMethods
    include Persistable::InstanceMethods

    attr_accessor :name, :genre, :songs, :song, :artist

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
    end
    def save
        @@all << self
    end

    def self.all
        @@all
    end


    def add_song(song) 
        @songs << song unless @songs.include?(song)
        song.artist = self unless song.artist == self
        
    end
    
    # def add_song(song)
    #     @songs << song unless @songs.include?(song)
    #     song.artist = self unless song.artist == self 
    # end

    def songs
      @songs
    end

    def self.find_by_name(name)
        @@all.detect{|artist| artist.name == name}

    end

    def self.create(song)
        c = self.new(song)
        c.save
        c
    end

    def self.destroy_all
      all.clear

    end

    def genres
        self.songs.collect { |song| song.genre}.uniq
    end

end
