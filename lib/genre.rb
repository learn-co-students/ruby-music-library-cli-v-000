class Genre
  include Concerns::Findable
  extend Concerns::ClassMods

  attr_accessor :name, :songs

    @@all = []

    def initialize(m)
      super
      @songs = []
    end

    def self.all
        @@all
    end

    def add_song(song)
      if !songs.include?(song)
        @songs << song
        song.genre=self
      end
    end

    def artists
      @songs.collect{|song| song.artist}.uniq
    end
end
