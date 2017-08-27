class Genre
  include Concerns::Findable::InstanceMethods
  extend Concerns::Findable
  @@all = []
  attr_accessor :name

  def initialize(name)
    @name = name
    @songs = []
  end
  def songs
    @songs
  end
  def artists
    self.songs.collect {|song| song.artist}.uniq
  end
  def self.all
    @@all
  end
  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end
end
