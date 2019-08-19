require 'pry'

class Artist

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

    def save
      @@all << self
    end

    def self.create(name)
      artist = Artist.new(name)

      @@all << artist
      artist
      end

    def self.all
    @@all
    end

    def self.destroy_all
      @@all.clear
    end

    def add_song(song)
    song.artist = self unless song.artist == self
    @songs.push(song) unless @songs.include?(song)

end



end
