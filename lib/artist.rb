require 'pry'
require_relative 'genre.rb'
require_relative 'song.rb'

class Artist
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
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    self.new(name).tap {|artist| artist.save}
    #self
  end

  def add_song(song) 
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)

    
  end

  def genres
    artists_songs = []
    self.songs.each do |song|
      artists_songs << song.genre unless artists_songs.include?(song.genre)
    end
    artists_songs
  end


end

#genre = Genre.new("indie rock")
#artist = Artist.new("Neutral Milk Hotel")
#song = Song.new("In an Aeroplane Over the Sea", artist, genre)
#song = Song.new("Two Headed Boy pt 1", artist, genre)

#binding.pry