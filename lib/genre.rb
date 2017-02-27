require_relative '../lib/concerns/findable.rb'

class Genre

extend Concerns::Findable

  attr_accessor :name, :songs, :artists, :genre, :artists_collection

  @@all = []

    def initialize(name)
      @name = name
      @songs = []
      @artists_collection = []
      save
    end

    def genre=(genre)
      song.genre = genre
    end

    def self.all
      @@all
    end

    def save
      @@all << self
    end

    def self.create(name)
      if find_by_name(name)
        find_by_name(name)
      else
        Genre.new(name)
      end
    end

    def self.destroy_all
      self.all.clear
    end

    def artists
      @artists_collection
    end

end
