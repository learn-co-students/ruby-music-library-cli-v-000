require 'pry'
class Artist

  attr_accessor :name, :songs
  @@all = []

    def initialize(name)
      @name = name
      @songs = []
    end

    def self.all
      @@all
    end

    def add_song(song)
      # binding.pry
      songs << song unless songs.include?(song)
      song.artist=(self) unless song.artist == self
      songs
      # binding.pry
    end

    def save
      @@all << self
      self
    end

    def self.create(name)
      self.new(name).save
    end

    def self.destroy_all
      @@all.clear
    end

    def genres
      songs.collect {|song| song.genre}.uniq
    end
end
