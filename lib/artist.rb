require_relative '../config/environment.rb'

class Artist
  extend Concerns::Findable

  attr_accessor :name
  @@all = []

  # Constructors

  # Usual constructor.
  def initialize(name)
    self.name = name
    @songs = []
  end

  # New and Save
  def self.create(name)
    self.new(name).tap {|a| a.save}
  end

  # Instance methods.

  def save
    @@all << self
  end

  def add_song(song)
    raise AssociationTypeMismatchError unless song.is_a? Song
    song.artist = self unless song.artist == self
    @songs << song if !self.songs.include?(song)
  end

  def songs
    @songs
  end

  def genres
    self.songs.collect { |song| song.genre }.uniq
  end

  # Class methods.

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end
end
