require 'pry'


class Artist

  extend Concerns::Findable
  attr_accessor :name, :artist, :songs, :genre

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def name
    @name
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def songs
    @songs
  end

  def add_song(song)
    song.artist = self if song.artist.nil?
    #binding.pry
    # @songs.detect { |song| song} == nil
    # !@songs.detect { |s| s == song }
    if !@songs.include? song
      @songs << song
    end
  end

  def genres
    @songs.collect{|song|song.genre}.uniq
    #binding.pry
  end

  #def genres
    #genres = []
    #genres << @songs.collect{|song|song.genre}.uniq
    #genres[0]
  #end

end
