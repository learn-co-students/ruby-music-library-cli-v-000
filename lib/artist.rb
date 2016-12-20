require_relative "../config/environment.rb"
#require_relative "../concerns/findable.rb"

class Artist
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def add_song(song)
    if !@songs.include?(song)
      @songs << song
    end
    if !song.artist
      song.artist = self
    end
  end

  def genres
    genres_array = []
    @songs.each do |song|
      genres_array << song.genre
    end
    genres_array.uniq
  end

end
