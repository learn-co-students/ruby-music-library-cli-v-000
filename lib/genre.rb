class Genre
  extend Concerns::Findable


    attr_accessor :name, :song

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

    def self.create(genre)
      genre = Genre.new(genre)
      # binding.pry
      genre.save
      genre
    end

    def self.all
      @@all
    end

    def add_song(song)
      if !self.songs.include?(song)
      @songs << song
    else
      song
    end
    end

    def songs
      @songs
    end

    def artists
      artists = @songs.collect do |s|
        s.artist
      end
      artists.uniq
    end
end
