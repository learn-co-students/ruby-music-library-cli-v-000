require 'pry'

class Genre

  attr_accessor :name
  attr_reader :songs

  extend Concerns::Findable

  @@genres = []

  def initialize(name)
    @name = name
    @songs = []
    self.save
  end

  def self.all
    @@genres
  end

  def self.destroy_all
    @@genres.clear
  end

  def save
    self.class.all << self
    self
  end

  def self.create(name)
    new(name).save
  end

  def add_song(song)
    song.genre = self unless song.genre != nil
    @songs << song unless @songs.include?(song)
  end

  def artists
    unique_items = self.songs.collect do |song|
      song.artist
    end
    unique_items.uniq
  end

end
