require 'pry'

class Artist

  attr_accessor :name, :songs

  extend Concerns::Findable
  extend Persistable::ClassMethods
  extend Memorable::ClassMethods
  extend Nameable::ClassMethods
  include Persistable::InstanceMethods
  include Nameable::InstanceMethods

  @@all = []

  def initialize(name)
    @name = name
    save
    @songs = []
  end

  def self.create(name)
    new(name).tap{|s| s.save}
  end

  def self.all
    @@all
  end

  def genres
    self.songs.collect{|s| s.genre}.uniq
  end


  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end

end
