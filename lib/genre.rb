require_relative './concerns/concerns_module.rb'

class Genre

  extend Concerns::Findable

  attr_accessor :name, :songs, :artist
    @@all = []

  def initialize (name)
    @name = name
    self.save
    @songs = []
  end

  def add_song (song)
    @songs << song unless @songs.include? (song)
    song.genre = self unless song.genre == self
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create (name)
    self.new (name)
  end

  def self.find_by_name(name)
    @@all.detect {|genre| genre.name == name}
  end

  def artists
    (@songs.collect {|song| song.artist}).uniq
  end

  def self.find_or_create_by_name(name)
   self.find_by_name(name) || self.create(name)
  end

end
