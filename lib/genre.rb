require_relative "concerns/findable.rb"

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
    @@all = []
  end

  def self.create(name)
    new_genre = Genre.new(name)
    new_genre.save
    new_genre
  end

  def save
    @@all << self
  end

  def add_song(song)
    if !@songs.include?(song)
      @songs << song
    end
  end

  def artists
    artist_list = []
    @songs.each do |song|
      if !artist_list.include?(song.artist)
        artist_list << song.artist
      end
    end
    artist_list
  end
end
