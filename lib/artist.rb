class Artist
  extend Concerns::Findable
  extend Concerns::Persistable::ClassMethods
  include Concerns::Persistable::InstanceMethods

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    self.save
  end

  def add_song(song)
    song.artist = self if !song.artist
    @songs << song if !@songs.include?(song)
    @songs.sort!{|a, b| a.name <=> b.name}
  end

  def genres
    @songs.collect{|song| song.genre}.uniq
  end

  def self.all
    @@all
  end
end
