require 'pry'
class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs, :genres, :artist

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

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist

  end

  def add_song(song)


    if song.artist.nil? == true
      song.artist = self

    end

    if !@songs.include?(song)

      @songs << song

    end


  end

  def genres
    container = []
    @songs.each do |collect|
      container << collect.genre

    end
    container.uniq
  end

end
