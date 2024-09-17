class Artist
  extend Concerns::Findable #Take all of methods in Findable module and add as class methods
  extend Persistable::ClassMethods
  include Persistable::InstanceMethods
  extend Nameable::ClassMethods

  attr_accessor :name, :songs
  attr_reader :genres
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist != nil
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end

end
