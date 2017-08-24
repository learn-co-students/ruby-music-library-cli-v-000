class Artist
  extend Memorable::ClassMethods
  extend Concerns::Findable
  include Memorable::InstanceMethods

  @@all = []

  attr_accessor :name

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all.sort!{|a, b| a.name <=> b.name}
  end

  def songs
    @songs.sort!{|a, b| a.name <=> b.name}
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    if song.artist == nil
      song.artist = self
    end
  end

  def genres
    @songs.collect {|song| song.genre}.uniq
  end

end
