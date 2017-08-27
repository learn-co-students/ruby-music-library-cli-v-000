class Artist
  include Concerns::Findable::InstanceMethods
  extend Concerns::Findable
  @@all = []
  attr_accessor :name

  def initialize(name)
    @name = name
    @songs = []
  end
  def self.all
    @@all
  end
  def songs
    @songs
  end
  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end
  def genres
    self.songs.collect {|song| song.genre }.uniq
  end
  def add_song(song)
    #song.artist = self if !song.artist
    song.artist ||= song.artist = self
    if !self.songs.include?(song)
      self.songs << song
    end
  end
end
