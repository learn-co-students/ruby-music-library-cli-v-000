class Artist
  attr_accessor :name, :songs

  extend Concerns::Findable
  extend Persistable::ClassMethods
  include Persistable::InstanceMethods

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def add_song(song)
    song.artist = self if song.artist.nil?
    self.songs << song unless self.songs.include?(song)
  end

  def genres
    @songs.collect {|song| song.genre}.uniq
  end
end