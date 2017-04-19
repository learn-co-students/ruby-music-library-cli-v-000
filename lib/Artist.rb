require 'pry'

class Artist
  attr_accessor :name, :songs, :genre
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
    song = self.new(name)
    song.save
    song
  end


  # def add_songs(songs)
  #   songs.each { |song| add_song(song) }
  # end

  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end

  # def songs
  #   @songs
  # end

  # def artists
  #   @songs.collect do |song|
  #     song.artist
  #   end
  # end
  #
  # def self.find_or_create_by_name(name)
  #   self.all.detect do |artist_obj|
  #     artist_obj.name == name
  #   end || Artist.new(name).save
  #   #Artist.create creates the instance of the class and saves it
  #   #A new create method would be needed for Artist.create to work
  # end
  #
  # def print_songs
  #   songs.select { |song| puts song.name }
  # end

end
