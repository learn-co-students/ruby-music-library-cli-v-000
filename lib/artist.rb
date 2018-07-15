class Artist
  include Concerns::InstanceMethods
  extend Concerns::ClassMethods
  extend Concerns::Findable

  attr_accessor :name
  @@all= []

  def self.all
    @@all
  end

  def initialize(name)
    super
    @songs=[]
  end

  def add_song(song)
    self.songs<<song unless self.songs.include?(song)
    song.artist= self unless song.artist !=nil
  end

  def songs
    @songs
  end

  def genres
    self.songs.collect { |song| song.genre }.uniq
  end
end
