require_relative "./concerns/concerns.rb"

class Artist
  extend Concerns::Findable
  @@all = []
  attr_accessor :name

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist != nil
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    self.new(name).tap {|artist| artist.save}
  end

  def self.destroy_all
    @@all.clear
  end
end
