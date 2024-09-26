class Artist
    extend Concerns::Findable
    attr_accessor :name, :song, :songs, :genre
    @@all = []

    def initialize(name)
      @name = name
      @@all << self
      @songs = []
    end

    def self.all
      @@all
    end
    def self.destroy_all
      @@all = []
    end
    def save
      @@all << self
    end
    def self.create (name)
      artist = Artist.new(name)
      artist.save
      artist
    end
    def add_song(song)
      song.artist = self if !song.artist
      @songs << song if !@songs.include?(song)
    end
    def genres
      genre_list = []
      @songs.uniq.collect{|song| genre_list << song.genre}
      genre_list.uniq
    end

  end
