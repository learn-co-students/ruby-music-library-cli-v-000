class Genre
  extend Concerns::Findable
  extend Concerns::ClassMethods
  include Concerns::InstanceMethods

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def artists
    self.songs.collect{|song| song.artist}.uniq
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end

end
