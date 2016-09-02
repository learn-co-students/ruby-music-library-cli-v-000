require 'pry'
class Song

  attr_accessor :name
  attr_reader :artist
  @@all = []

    def initialize(name, artist = nil)
      @name = name
      artist=(artist) unless artist == nil
    end

    def artist=(artist)
      @artist = artist
      artist.add_song(self)
      #binding.pry
    end

    def self.all
      @@all
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

end
