#require 'pry'
require 'pry'
class Song

    attr_accessor :name, :artist

    @@all = []

    def initialize(name, artist = nil)
      @name = name
      self.artist = artist
    end

    def self.all
      @@all
    end

    def self.destroy_all
      @@all.clear
    end

    def self.save
      @@all << self
    end

    def self.create(name)
      new(name).tap{|s| s.save}
    end

    # def add_song(song)
    #   @songs << song unless song.artist == self
    #   song.artist = self
      # end

    def artist=(artist)
      @artist = artist
      artist.add_song(self)
    end

    Song.new("Comatose", "Skillet")
    binding.pry


end
