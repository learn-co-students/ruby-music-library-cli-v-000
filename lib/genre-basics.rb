require_relative "../config/environment.rb"

class Genre
  extend Concerns::Findable
  include Concerns::Stringable
  

  @@all = []

  attr_accessor :name

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

  def songs
    @songs
  end

  def add_song(song)
    @songs << song unless songs.include?(song)
    if song.genre == nil
      song.genre = self
    end
  end

  def artists
     @songs.map do |song|
       song.artist
     end
     .uniq
   end

end
