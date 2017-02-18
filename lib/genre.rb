require 'pry'
class Genre
  include Concerns::Findable
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  `def songs
    @songs
  end`

  def add_song(song)
    song.genre = self unless song.genre == self
    self.songs << song unless @songs.include?(song)
  end

  def artists
    self.songs.collect{|song| song.artist}.uniq
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save

    @@all << self
    # binding.pry
    self
  end

  def self.create(name)
    #we are in genre, not song (: )
    self.new(name).tap{ |g| g.save}
    #new_song.save
  end
end
