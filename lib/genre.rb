class Genre

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
      genre = Genre.new(name)
      genre.save
      genre
    end

    def self.destroy_all
      self.all.clear
    end

    def songs
      @songs
    end

    def artists
      @songs.collect {|song| song.artist}.uniq
    end
end
