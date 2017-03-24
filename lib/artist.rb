class Artist

  extend Concerns::Findable
  extend Persistable::ClassMethods

  include Persistable::InstanceMethods

  attr_accessor :name, :songs, :genre

  def initialize(name)
    @name=name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def add_song(song)
    @songs << song if !self.songs.include?(song)
    song.artist = self if !song.artist
  end

  def genres
      self.songs.collect { |a| a.genre }.uniq
  end

end
