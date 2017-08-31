class Artist
  extend Concerns::Findable
  extend Persistable::ClassMethods
  extend Nameable::ClassMethods
  include Persistable::InstanceMethods

  attr_accessor :name

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def add_song(song)
    song.artist=(self) unless song.artist == self
    @songs << song unless @songs.include?(song)
  end

  def genres
    @songs.map{|song| song.genre}.uniq
  end

end
