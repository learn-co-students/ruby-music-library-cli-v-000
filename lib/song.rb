require "pry"
class Song
    include Concerns::Findable
    extend Concerns::ClassMods

    attr_accessor :name, :genre
    attr_reader :artist


    @@all = []

    def initialize(n, artist=nil, genre=nil)
        super
        self.artist=artist
        self.genre=genre
    end

    def self.all
        @@all
    end

    def artist=(artist)
        if @artist.nil? && !artist.nil?
            @artist = artist
            artist.add_song(self)
        end
    end

    def genre=(genre)
      if @genre.nil? && !genre.nil?
        @genre = genre
        genre.add_song(self)
      end
    end

end
