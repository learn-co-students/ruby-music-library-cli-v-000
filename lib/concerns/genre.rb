require 'pry'

class Genre
  extend Concerns::Findable

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  #  @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    #new_name = Genre.name
    @@all << self 
  end

  #Custom Constructor
  def self.create(new_genre)
    n = Genre.new(new_genre).tap{|g| g.save}
    n
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.genre = self unless song.genre
  end
 # binding.pry

  def artists
    @songs.collect {|song| song.artist}.uniq
  end
end
