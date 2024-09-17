class Genre
  extend Concerns::Findable #Take all of methods in Findable module and add as class methods
  extend Persistable::ClassMethods
  include Persistable::InstanceMethods
  extend Nameable::ClassMethods

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.genre = self unless song.genre != nil
  end

  def artists
    self.songs.collect {|s| s.artist}.uniq
  end

end
