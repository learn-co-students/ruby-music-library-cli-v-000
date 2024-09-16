class Genre
    extend Concerns::Findable

    attr_accessor :name, :song

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
      genre = Genre.new(name)
      genre.save
      genre
    end

    def songs
      @songs
    end

    def artists
      all_artists = []

      self.songs.collect do |song|
        all_artists << song.artist
      end
      all_artists.uniq
    end
  end
