require 'pry'
class Artist

  extend Concerns::Findable

  attr_accessor :name, :songs
  @@all = []

    def initialize(name)
      @name = name
      @songs = []
    end

    def self.create(name)
      self.new(name).save
    end

    def save
      @@all << self
      self
    end

    def add_song(song)
      songs << song unless songs.include?(song)
      song.artist=(self) unless song.artist == self
      #songs
    end

    def genres
      songs.collect {|song| song.genre}.uniq
    end

    def self.all
      @@all
    end

    def self.destroy_all
      @@all.clear
    end

end
