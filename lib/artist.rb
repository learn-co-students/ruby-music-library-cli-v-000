require 'pry'

class Artist #has many songs and genres
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def genres
    (self.songs.collect {|song_instance| song_instance.genre}).uniq
  end

  def self.all
    @@all
  end

  def save #returns an array
    @@all << self
    self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    Artist.new(name).save
  end

  def add_song(song_instance)
    if song_instance.artist == nil #we want to add this instance of an artist as the artist of the song instance
      song_instance.artist = self
    end
    if @songs.include?(song_instance) == false
      @songs << song_instance
    end
  end
end
