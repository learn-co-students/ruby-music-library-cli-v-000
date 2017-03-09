require_relative '../concerns/findable.rb'

class Artist
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    unless @songs.include?(song) do
        @songs << song
      end
    end
    if song.artist != self
      song.artist = self
    end
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  # constructor
  def self.create(name)
    new_by_name = Artist.new(name)
    new_by_name.save
    new_by_name
  end
end
