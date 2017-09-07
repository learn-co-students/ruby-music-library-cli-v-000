class Artist
    extend Concerns::Findable
    attr_accessor :name, :songs

    @@all = []

    def initialize(name)
      @name = name
      @songs = []
    end

    def save
      @@all << self
    end

    def self.destroy_all
      @@all.clear
    end

    def self.create(artist)
      artist = Artist.new(artist)
      # binding.pry
      artist.save
      artist
    end

    def self.all
      @@all
    end

    def add_song(song)
      if song.artist != self
      song.artist = self
      else
        song
      end
      if !songs.include?(song)
        @songs << song
      else
        songs
      end
    end

    def songs
      @songs
    end

    def genres
        genres = @songs.collect do |s|
        s.genre
        end
      genres.uniq
    end

end
