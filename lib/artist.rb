require 'pry'

class Artist
  
  extend Concerns::ClassMethods
  extend Concerns::Findable
  include Concerns::InstanceMethods
  include Paramable

  attr_accessor :name
  attr_reader :songs, :genres

  @@all = []

  def initialize name
    @name  = name
    @songs = []
    @all_genres = []
    @@all << self
  end

  def genres
    @all_genres
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self if !@@all.include?(self)
    self
  end

  def add_song (song)
    song.name_artist = self if !(song.artist == self)
    @songs << song if !@songs.include?(song)
  end

  def self.create name
    artist = self.new(name).save
  end

  def add_songs(songs)
    songs.each { |song| add_song(song) }
  end

  def self.destroy_all
    self.all.clear
    self
  end
end
