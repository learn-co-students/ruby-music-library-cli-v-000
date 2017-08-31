class Genre
  extend Concerns::Findable
  extend Persistable::ClassMethods
  extend Nameable::ClassMethods
  include Persistable::InstanceMethods
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def songs
    @songs
  end

  def add_song(song)
    song.genre=(self) unless song.genre == self
    @songs << song unless @songs.include?(song)
  end

  def artists
    @songs.map{|song| song.artist}.uniq
  end

end
