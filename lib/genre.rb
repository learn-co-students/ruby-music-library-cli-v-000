require 'pry'

class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs

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

  def self.create(name)
    Genre.new(name).tap {|g| g.save}
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.genre = self if song.genre.to_s == ''
  end

  def artists
   self.songs.collect{|s| s.artist}.uniq
  end

end
