require 'pry'

class Genre
    extend Concerns::Findable
    extend Persistable::ClassMethods
    include Persistable::InstanceMethods

    attr_accessor :name, :songs, :artists

    @@all = []
    def initialize(name)
        @name = name
        @songs = []
    end

    def self.all
        @@all
    end 
    def self.destroy_all
        self.all.clear

    end
    
    def songs
        @songs
    end
    # def add_song(song)
    #     @song << song
    # end
    def artists
        self.songs.collect {|song| song.artist}.uniq
    end

    def save
        @@all << self
    end
    def self.create(genre)
        c = self.new(genre)
        c.save
        c
    end

end