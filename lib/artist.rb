class Artist
  extend Concerns::Memorable::ClassMethods
  extend Concerns::Findable
  include Concerns::Memorable::InstanceMethods

  attr_accessor :name, :songs

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    self.name = name
    self.songs = []
  end

  def add_song(song)
    songs << song if !songs.include?(song)
    song.artist = self if song.artist == nil
  end

  def genres
    songs.map { |song| song.genre }.to_set.to_a
  end
end
