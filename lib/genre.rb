require 'concerns/findable.rb'

class Genre
  extend Concerns::Findable
  
  attr_accessor :name, :songs, :artists

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    Genre.new(name).tap{|x| x.save}
  end

  def add_song(song)
     song.genre = self unless song.genre
     @songs << song unless @songs.include?(song)
  end

  def artists
    artist = self.songs.collect do |song|
        song.artist
    end
    artist.uniq
  end
end