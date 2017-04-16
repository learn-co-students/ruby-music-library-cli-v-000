require 'pry'
class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre #ㅇ이걸 왜 해야 하지
    #binding.pry
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def artists
    artists = []
    self.songs.each do |song|
      artists << song.artist unless artists.include?(song.artist)
    end
    artists
  end

end
