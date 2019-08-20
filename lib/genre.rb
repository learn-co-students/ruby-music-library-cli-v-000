require 'pry'
class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = Array.new

  def initialize(name, songs=nil)
    @name = name
    !songs ? @songs = [] : @songs = songs
  end

  def name=(new_name)
    @name = new_name
  end

  def add_song(song)
    if !@songs.include?(song)
      @songs << song;
      song.genre = self
    end
  end

  def artists
    artists = [];
    @songs.each do |song|
      !artists.include?(song.artist) ? artists << song.artist : nil
    end
    artists
  end

  def save
     @@all << self
    end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = Array.new
  end

  def self.create(name)
    new_genre = Genre.new(name)
    new_genre.save
    new_genre
  end

end
