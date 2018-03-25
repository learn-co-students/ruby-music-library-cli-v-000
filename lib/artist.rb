require 'pry'

class Artist
  extend Concerns::Findable
  attr_reader :songs
  attr_accessor :name
  @@all = []
  # @@all = []
  #
  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    #
    # song.artist == "Unknown" ? song.artist = self : song.artist
    song.artist = self unless song.artist
    @songs << song unless @songs.include?(song)
  end
  #
  def genres
    songs.collect(&:genre).uniq
    # genres = @songs.collect {|song| song.genre}
    # genres.uniq
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    self.new(name).tap do |new_instance|
      @@all << new_instance
    end
  end
  # def self.all
  #   @@all
  # end
  #
  # def save
  #   @@all << self
  # end
  #
  # def self.destroy_all
  #   @@all.clear
  # end
  #
  # def self.create(name)
  #   self.new(name).tap do |new_instance|
  #     @@all << new_instance
  #   end
  # end
end
