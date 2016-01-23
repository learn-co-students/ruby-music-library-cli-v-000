require_relative '../concerns/findable.rb'


class Genre

  attr_accessor :name

  extend Concerns::Findable

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

  def songs
    @songs 
  end


  def self.create(genre_name)
    genre = self.new(genre_name)
    genre.save
    genre
  end

  def add_song(song)
    if songs.include?(song)
      song
    else
      @songs << song
      song.genre = self
    end
  end

  def songs
    @songs
  end

  def artists
    x = self.songs.collect do |song|
      song.artist
    end
    return x.uniq
  end



end

















