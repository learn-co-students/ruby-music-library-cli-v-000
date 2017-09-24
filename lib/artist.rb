require 'pry'

class Artist

  attr_accessor :name
  attr_reader :songs

  extend Concerns::Findable

  @@artists = []

  def initialize(name)
    @name = name
    @songs = []
    self.save
  end

  def self.all
    @@artists
  end

  def self.destroy_all
    @@artists.clear
  end

  def save
    self.class.all << self
    self
  end

  def self.create(name)
    new(name).save
  end

  def add_song(song)
    song.artist = self unless song.artist != nil
    @songs << song unless @songs.include?(song)
  end

  def genres
    unique_items = self.songs.collect do |song|
      song.genre
    end
    unique_items.uniq
  end

end
