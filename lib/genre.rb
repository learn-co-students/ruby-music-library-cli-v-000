class Genre
  
  extend Concerns::Findable
    attr_accessor :name

    @@all = []

    def initialize(name)
      @name = name
      @songs = []
    end

    def self.all
      @@all
    end

    def self.destroy_all
      self.all.clear
    end

    def save
      self.class.all << self
    end

    def self.create(name)
      new_genre = Genre.new(name)
      new_genre.save
      new_genre
    end

    def songs
      @songs
    end

    def artists #genre has artists through songs
      @songs.collect do |song|
        song.artist
      end.uniq
    end
  end