class Artist
  extend Memorable::ClassMethods
  include Memorable::InstanceMethods
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    unless song.artist
      @songs << song
      song.artist = self
    end
  end

  def genres
    songs.map { |song| song.genre }.uniq
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

end
