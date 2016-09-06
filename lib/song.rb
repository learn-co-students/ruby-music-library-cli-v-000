require 'pry'
class Song

  attr_accessor :name, :genre
  attr_reader :artist

  @@all = []

    def initialize(name, artist = nil, genre = nil)
      @name = name
      self.artist=(artist) unless artist == nil
      #binding.pry
      self.genre = genre unless genre == nil
    end

    def artist=(artist)
      @artist = artist
      # binding.pry
      artist.add_song(self) unless artist.songs.include?(self)
      # binding.pry
    end

    def genre=(genre)
      @genre = genre
      genre.add_song(self) unless genre.songs.include?(self)
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
