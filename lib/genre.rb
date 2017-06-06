#require 'pry'
class Genre
  include Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
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

  def self.create(name)
    new(name).tap{|s| s.save}
    #binding.pry
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.genre = self unless song.genre == self
    #binding.pry
  end

  def artists
    self.songs.collect{|song| song.artist}.uniq
    #self.songs.collect do |song|
    #  song.genre
    #binding.pry
    #end.uniq
  end



end
