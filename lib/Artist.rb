require 'pry'

class Artist
  attr_accessor :name, :songs, :genre, :song
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
    self
  end

  def self.create(name)
    self.new(name).save
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end

  def genres
    self.songs.map{ |song| song.genre }.uniq
  end

  def self.find_or_create_by_name(name)
    self.all.detect do |artist_obj|
      artist_obj.name == name
    end || Artist.new(name).save
    #Artist.create creates the instance of the class and saves it
    #A new create method would be needed for Artist.create to work
  end

end
