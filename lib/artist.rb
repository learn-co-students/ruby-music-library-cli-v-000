require_relative "../config/environment.rb"
#require_relative "./music_base.rb"
#require_relative "./Concerns::Findable.rb"

class Artist # < Music
  extend Concerns::Findable

  attr_reader :songs
  attr_accessor :name

  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
      self.all.clear
  end

  def self.create(name)
    s = self.new(name)
    s
  end

  def initialize(name)
  end

  def save
    if self.class.all.include?(self)
      return nil
    end

    self.class.all << self
  end

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def add_song(song)
    song.artist = self if !!!song.artist

    if songs.include?(song)
      return nil
    end

    @songs << song
  end

  def genres
    ret = songs.collect { |e| e.genre}
    ret = ret.uniq
    ret
  end
end
