class Genre
    extend Concerns::Findable
    attr_accessor :name, :songs, :artists


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

    def self.create(genre)
      genre = Genre.new(genre)
      genre.save
      genre
    end

    def artists
      self.songs.map{|song| song.artist}.uniq
    end

end