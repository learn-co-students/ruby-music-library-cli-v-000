require 'pry'
class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs, :genre, :artists
  @@all = []

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

    @@all << self
  end

  def self.create(new_name)
    genre = Genre.new(new_name)
    genre.save
    genre

  end

  def artists
    coll = []
    @songs.each do |song|
      coll << song.artist

    end
    coll.uniq


  end



end
