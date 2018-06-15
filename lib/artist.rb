class Artist

    attr_accessor :name

    extend Concerns::Findable

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

    def self.create(name)
      artist = Artist.new(name)
      artist.save
      artist
    end

    def self.destroy_all
      self.all.clear
    end

    def add_song(song)
      if song.artist == nil
        song.artist = self
      end
      @songs << song if !@songs.include?(song)
    end

    def songs
      @songs
    end

    def genres
      @songs.collect {|song| song.genre}.uniq
    end
end
