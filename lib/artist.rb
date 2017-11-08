class Artist

  extend Concerns::Findable
  extend Concerns::ClassMethods
  include Concerns::InstanceMethods

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
  @@all
  end

  def add_song(song)
    @songs << song unless @songs.include?(song) #check for duplicate
    song.artist = self if song.artist == nil
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all<<self
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def genres
    self.songs.collect{|song| song.genre}.uniq
  end

  def songs
    @songs
  end

end
