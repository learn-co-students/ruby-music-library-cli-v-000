
#require 'pry'
class Song

    attr_accessor :name, :artist, :genre

    @@all = []

    def initialize(name, artist = nil, genre = nil)
      @name = name
      self.artist = artist unless artist == nil
      self.genre = genre unless genre == nil
      save
    end

    def self.all
      @@all
    end

    def self.destroy_all
      @@all.clear
    end

    def save
      @@all << self
    end

    def self.create(name)
      new(name).tap{|s| s.save}
    end

    def add_song(song)
      @songs << song unless song.artist == self
      song.artist = self
    end

    def artist=(artist)
      @artist = artist
      artist.add_song(self)
    end

    def genre=(genre)
      @genre = genre
      genre.add_song(self)
    end
end
    # Song.new("Gold and Silver", "Stavesacre")
    # binding.pry
