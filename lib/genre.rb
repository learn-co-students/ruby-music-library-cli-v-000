class Genre
  extend Concerns::Findable
  extend Persistable::ClassMethods
  include Persistable::InstanceMethods

  attr_accessor :name
  attr_reader :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  @@all = []

  def self.all
    @@all
  end

  def add_song(song)
    self.songs << song unless self.songs.include?(song)
    song.genre = self if song.genre == nil
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end
end
