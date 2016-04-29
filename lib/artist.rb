require_relative '../concerns/concerns.rb'

class Artist
  attr_accessor :name, :songs
  extend Concerns::Findable
  @@all = []

  def initialize(name)
    @name = name
    @songs =[]
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def add_song(song)
    self.songs << song unless songs.include?(song)
    song.artist = self unless song.artist
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def genres
    self.songs.collect do |song|
      song.genre
      # binding.pry
    end.uniq
  end

end
