require 'pry'

class Artist

  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  #INSTANCE METHODS
  def initialize(name)
    @name = name
    @songs = []
  end

  def name=(name)
    @name = name
  end

  def save
    @@all << self
  end

  def add_song(song)
    self.songs << song unless self.songs.include? song
    song.artist = self unless song.artist
  end

  def genres
    self.songs.collect do |s|
      s.genre
    end.uniq
  end

  #CLASS METHODS
  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

end
