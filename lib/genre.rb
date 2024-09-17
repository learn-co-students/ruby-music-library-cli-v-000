require_relative '../concerns/findable.rb'
require_relative '../concerns/nameable.rb'
require_relative '../concerns/persistable.rb'

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

  def self.create(gen)
    genre = Genre.new(gen)
    genre.save
    genre
  end

  def add_song(sng)
    if(sng.artist == nil)
      sng.artist = self
    end
    if(!@songs.include?(sng))
      @songs << sng
    end
  end

  def artists
    art = []
    @songs.each do |song|
      if !art.include?(song.artist)
        art << song.artist
      end
    end
    art
  end
end