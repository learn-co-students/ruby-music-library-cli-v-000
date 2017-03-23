class Genre

    extend Concerns::Findable
    attr_accessor :name, :songs
    @@all = []

    def initialize(name)
      @name=name
      @songs = []
    end

    def save
      genre = Genre.new(name)
      @@all << self
    end

    def self.all
      @@all
    end

    def self.create(name)
      genre = Genre.new(name)
      genre.save
      genre
    end

    def self.destroy_all
      @@all.clear
    end

    def add_song(song)
      @songs << song if !self.songs.include?(song)
      song.genre = self if !song.genre
    end

    def artists
        self.songs.collect { |a| a.artist }.uniq
    end


end
