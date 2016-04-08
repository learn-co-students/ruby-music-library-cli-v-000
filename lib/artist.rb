class Artist
  extend Concerns::Findable
  extend Concerns::Memorable::ClassMethods
  include Concerns::Memorable::InstanceMethods

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def add_song(song)
    unless songs.include?(song)
      self.songs << song
      song.artist = self 
    end
  end

  def genres
    songs.collect { |song| song.genre }.uniq
  end
end