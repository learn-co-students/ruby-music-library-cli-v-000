class Genre
  extend Concerns::Findable

    attr_accessor :name, :song, :artist

    @@all = []

    def initialize(name)
      @name = name
      @songs = []
    end

    def songs
      @songs
    end

    def add_song(song)
      song.genre = self unless song.genre == self
      @songs << song unless @songs.include?(song)
    end

    def artists
      @songs.collect {|song| song.artist}.uniq
    end

    def self.create(name)
      genre = Genre.new(name)
      genre.save
      genre
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

end
