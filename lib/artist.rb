class Artist
  extend Concerns::Memorable::ClassMethods
  extend Concerns::Findable
  include Concerns::Memorable::InstanceMethods

  attr_accessor :name
  attr_reader :songs
  @@all = []

  def initialize(name)
    super
    @songs = []
  end

  def self.all
    @@all
  end

  def add_song(song)
    if self.songs.include?(song) == false
      self.songs << song
      song.artist = self
    end
  end
end
