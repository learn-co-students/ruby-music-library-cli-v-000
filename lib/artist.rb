class Artist
  extend Concerns::Findable
  include Concerns::Persistable::InstanceMethods
  extend Concerns::Persistable::ClassMethods
  extend Concerns::Nameable::ClassMethods

  attr_accessor :name
  attr_reader :songs
  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    if song.class == Song
      self.songs << song unless self.songs.include?(song)
      song.artist = self unless song.artist == self
    end
  end

  def genres
    @songs.collect{|s| s.genre}.uniq
  end

 end
