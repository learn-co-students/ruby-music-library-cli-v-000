require 'pry'

class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs, :artist

  @@all = []

  def save
    @@all << self
  end

  def initialize(name)
    @name = name
    @songs = []
    self.save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    self.new(name)
  end

  def add_song(song_instance)
    if song_instance.genre == nil
      song_instance.genre=self
    end
    if @songs.detect{|i| i == song_instance} == nil
      @songs << song_instance
    end
  end

  def artists
    artists = []
    songs = self.songs
      songs.each do |song|
        if artists.detect{|a| a == song.artist} == nil
          artists << song.artist
        end
      end
      artists
  end


end
