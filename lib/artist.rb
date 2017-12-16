# require_relative './song.rb'

class Artist
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    # self.save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist

    # new(name).tap{|a| a.save}
  end

  def add_song(song)
    songs << song unless songs.include?(song)
    song.artist = self unless song.artist != nil
  end

  def genres
    songs.collect {|song| song.genre }.uniq
  end
end
