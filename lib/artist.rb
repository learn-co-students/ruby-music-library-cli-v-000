class Artist
  extend Concerns::Findable
  extend Concerns::Nameable::ClassMethods
  extend Concerns::Persistable::ClassMethods
  include Concerns::Persistable::InstanceMethods

  attr_accessor :name
  @@all = []

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

  def add_song(song)
    if song.artist.nil?
      song.artist = self
    end
    @songs << song unless @songs.include?(song)
  end

  def genres
    self.songs.collect { |song| song.genre }.uniq
  end

end
