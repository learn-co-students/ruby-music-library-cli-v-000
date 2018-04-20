require_relative "../config/environment.rb"
#require_relative "./music_base.rb"
#require_relative "./Concerns::Findable.rb"

class Genre # < Music
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

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
    if @songs.include?(song)
      return nil
    end

    @songs << song
  end

  def artists
    ret = songs.collect { |e| e.artist}
    ret = ret.uniq
    ret
  end
end
