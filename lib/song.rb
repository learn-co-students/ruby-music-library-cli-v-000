require 'pry'
class Song

  include Concerns::Findable

  attr_accessor :name, :genre
  attr_reader :artist

  @@all = []

    def initialize(name, artist = nil, genre = nil)
      @name = name
      self.artist=(artist) unless artist == nil
      self.genre = genre unless genre == nil
    end

    def artist=(artist)
      @artist = artist
      artist.add_song(self) unless artist.songs.include?(self)
    end

    def genre=(genre)
      @genre = genre
      genre.add_song(self) unless genre.songs.include?(self)
    end

    def self.all
      @@all
    end

    def save
      @@all << self
      self
    end

    def self.create(name)
      self.new(name).save
    end

    def self.destroy_all
      @@all.clear
    end

    def self.find_by_name(name)
      all.find{|song| song.name == name}
    end

    def self.find_or_create_by_name(name)
      find_by_name(name) || create(name)
    end

end
