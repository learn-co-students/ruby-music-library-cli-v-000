require_relative './concerns/concerns_module.rb'

class Artist
extend Concerns::Findable

attr_accessor :name, :songs

  @@all = []

  def initialize (name)
    @name = name
    self.save
    @songs = []
  end

  def add_song (song)
    @songs << song unless @songs.include? (song)
    song.artist = self unless song.artist == self
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

  def genres
    (@songs.collect {|song| song.genre}).uniq
  end

  def self.find_by_name(name)
    @@all.detect {|artist| artist.name == name}
  end

  def self.find_or_create_by_name(name)
   self.find_by_name(name) || self.create(name)
  end

end
