require_relative './concerns/findable.rb'

class Genre
  attr_accessor :name
  @@all=[]

  extend Concerns::Findable
  
  def initialize(name)
    @name=name
    @songs = []
  end

  def songs
    @songs
  end

    def self.all
      @@all
    end

    def self.destroy_all
      @@all.clear
    end

    def save
      @@all<<self
    end

    def self.create(name)
      new_genre = Genre.new(name)
      new_genre.save
      new_genre
    end

    def artists
      new_array = self.songs.collect {|song| song.artist}
      new_array.uniq
    end


end
