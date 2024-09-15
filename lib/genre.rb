require_relative 'concerns/findable'

class Genre
    extend Concerns::Findable
    
    attr_accessor :name, :songs

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def self.destroy_all
        self.all.clear
    end

    def self.create(name)
        genre = Genre.new(name)
        genre.save
        genre
    end

    def add_song(song)
        song.genre = self unless song.genre
        self.songs << song unless self.songs.include?(song)
    end

    def artists
        artist_list = []
        self.songs.each do |song|
            artist_list << song.artist unless artist_list.include?(song.artist)
        end
        artist_list
    end


end
