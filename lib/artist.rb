class Artist

  extend Concerns::Findable
  extend Concerns::ClassMethods
  include Concerns::InstanceMethods

  attr_accessor :name
  attr_reader :songs

    @@all = []

  def initialize(name)
    self.name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def add_song(song)
    self.songs << song if !self.songs.include?(song)
    song.artist = self if song.artist == nil
  end

  def genres
    self.songs.map {|song| song.genre}.uniq
  end
end
