class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs

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

    def self.destroy_all
      @@all.clear
    end

    def self.create(name)
      s = new(name)
      s.save
      s
    end

    def songs
      @songs
    end

    def add_song(song)
      @songs << song unless @songs.include?(song)
      song.artist = self unless song.artist == self
      song
    end

    def genres
      genres = @songs.collect do |song|
        song.genre
      end
      genres.uniq
    end

end
