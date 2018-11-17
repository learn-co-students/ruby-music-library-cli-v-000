class Artist
  extend Concerns::Findable
  extend Concerns::Memorable::ClassMethods
  include Concerns::Memorable::InstanceMethods

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    super()
  end

  def self.all
    @@all
  end

  def genres
    @songs.collect{|s| s.genre}.uniq
  end

  def add_song(song)
    unless self.songs.include?(song)
      @songs << song
    end
    if song.artist.nil?
      song.artist = self
    end
    self
  end
end
