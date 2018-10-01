require 'pry'
class Artist
    extend Concerns::Findable
      attr_accessor :name, :genre, :songs

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

    def save
      self.class.all << self
    end

    def self.create(name)
      new_artist = Artist.new(name)
      new_artist.save
      new_artist
    end

    def add_song(song)
      song.artist = self if song.artist != self
      @songs << song unless @songs.include?(song)
    end

    def genres  #has genres through songs
      @songs.collect do |song|
      song.genre
      end.uniq
    end
end