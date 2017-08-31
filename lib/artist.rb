class Artist
  extend Concerns::Findable
  extend Persistable::ClassMethods
  include Persistable::InstanceMethods
  extend Nameable::ClassMethods

  attr_accessor :name

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def add_song(song) #I'll be putting in a Song instance as an argument
    song.artist=(self) unless song.artist == self # Write the Artist in, unless the song's artist reader is already defined
    songs << song unless songs.include?(song)
  end

  def genres
    songs.map{|song| song.genre }.uniq
  end

end
