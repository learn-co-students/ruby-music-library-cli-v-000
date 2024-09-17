class Artist
  extend Concerns::Findable
  extend Concerns::Persistable::ClassMethods
  extend Concerns::Nameable::ClassMethods
  include Concerns::Persistable::InstanceMethods

  attr_accessor :name, :songs

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist == self
  end

  def genres
    @songs.collect {|song| song.genre}.uniq
  end

end
