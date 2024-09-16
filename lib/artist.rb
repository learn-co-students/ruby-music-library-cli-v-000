require "pry"
class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all=[]

    def initialize(name)
      @name=name
      @songs=[]
    end

    def self.destroy_all
      @@all.clear
    end

    def self.all
      @@all
    end

    def save
      @@all << self
    end

    def self.create(name)
      artist=Artist.new(name)
      artist.save
      artist
    end

    def add_song(song)
      songs << song if !songs.include?(song)
      song.artist = self if song.artist !=self
    end

    def genres
      @genres=[]
      Genre.all.each do |genre_i|
        self.songs.each do |song_i|
        @genres << genre_i if genre_i.songs.include?(song_i) && !@genres.include?(genre_i)
        end
      @genres
      # binding.pry
      end
    end


end
