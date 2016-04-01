require 'concerns/findable.rb'

class Artist
  extend Concerns::Findable
  
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end
  

  def genres
    genre = self.songs.collect do |song|
        song.genre
    end
    genre.uniq
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
    Artist.new(name).tap{|x| x.save}
  end

  def add_song(song)
     song.artist = self unless song.artist == self
     @songs << song unless @songs.include?(song)
  end
end