require 'pry'
require './lib/concerns/findable.rb'


class Genre

  extend Findable::ClassMethods
  include Findable::InstanceMethods
  
    attr_accessor :name, :songs
    @@all = []

    def initialize(name)
      @name = name
      @songs = []
    end

    def songs
      @songs
    end

    def add_song(song)
      @songs << song
    end

    def artists
     @artists = @songs.collect do |song|
        song.artist
      end
      @artists = @artists.uniq
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

    def self.create(name)
      genre = Genre.new(name)
      genre.save
      genre
    end
end
