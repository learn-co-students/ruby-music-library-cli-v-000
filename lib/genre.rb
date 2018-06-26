require "pry"
class Genre
  extend Concerns::Findable
  
  @@all = []

  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    created_genre = Genre.new(name)
    created_genre.save
    created_genre
    # binding.pry
  end

  def artists
    artists = []
    @songs.each do |e|
      if !artists.include?(e.artist)
        artists << e.artist
      end
    end
    artists
  end
end
