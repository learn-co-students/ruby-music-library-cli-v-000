require "pry"
class Song
    include Concerns::Basics
    extend Concerns::Findable


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

    def self.new_from_filename(filename)
      temp =filename.split(" - ")
      artist=Artist.find_or_create_by_name(temp[0])
      genre = Genre.find_or_create_by_name(temp[2].sub(".mp3",""))
      new(temp[1], artist, genre)
    end

    def self.create_from_filename(filename)
      temp=new_from_filename(filename)
      temp.save
      temp
    end
end
