class Artist
  extend Concerns::Findable
  extend Memorable::ClassMethods
  include Memorable::InstanceMethods

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
    @songs << song unless songs.include?(song)
    if song.artist == nil
      song.artist = self
    end
  end

  def genres
    self.songs.collect{|song| song.genre}.uniq
  end
end
