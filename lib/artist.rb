require_relative '../concerns/findable.rb'
require_relative '../concerns/print.rb'

class Artist

    extend Concerns::Findable

    attr_accessor :name, :song, :genres

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

    def self.print_all
        @@all.each {|artist| puts "#{artist.name}"}
    end

    def add_song(song)
      @songs << song if !songs.include?(song)
      song.artist = self if !song.artist
    end

    def songs
      @songs
    end

    def genres
      genres = []
      @songs.each {|song| genres << song.genre }
      genres.uniq
    end

    def self.destroy_all
      @@all = []
    end

    def self.create(songname)
      song = self.new(songname)
      song.save
      song
    end

end
