require_relative './concerns/findable.rb'

class Genre
  attr_accessor :name, :songs
  @@all = []
  extend Concerns::Findable


    def initialize(name)
      @name = name
      @songs = []
    end

    def save
      @@all << self
    end

    def artists
      self.songs.collect {|song| song.artist}.uniq
    end

    def add_song(song)
      song.genre = self if song.genre == nil
      self.songs << song unless self.songs.include?(song)
    end

    def songs
      @songs
    end



      def self.all
        @@all
      end

      def self.destroy_all
        self.all.clear
      end

      def self.create(name)
        genre = self.new(name)
        genre.save
        genre
      end









end
