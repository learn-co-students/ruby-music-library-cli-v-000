require 'pry'
class Artist
  extend Concerns::Findable
  attr_accessor :name, :song, :genre
  @songs = []
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def genres
    songs.collect(&:genre).uniq
  end

  def add_song(song)
    if songs.detect {|o| o == song}
      return nil
    else
      songs << song
    end
    if song.artist == nil
      song.artist = self
    end
  end

  def songs
    @songs
  end

  def name
    @name
  end

  def name=(name)
    @name = name
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
    self.new(name)
  end
end
