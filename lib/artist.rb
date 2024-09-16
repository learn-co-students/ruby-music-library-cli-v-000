class Artist
    extend Concerns::Findable
    
    attr_accessor :name, :songs, :genres

    @@all = []

    def initialize(name)
      @name = name
      @songs = []
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
      artist = Artist.new(name)
      artist.save
      artist
    end

    def add_song(song)
      @songs << song unless songs.include?(song)

      if song.artist == nil
        song.artist = self
      end
    end

    def songs
      @songs
    end

    def genres
      all_genres = []

      self.songs.collect do |song|
          all_genres << song.genre
      end
      all_genres.uniq
    end

  end
