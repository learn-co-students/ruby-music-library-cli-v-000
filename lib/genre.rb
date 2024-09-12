class Genre
  extend Concerns::Findable
  extend Persistable::ClassMethods
  include Persistable::InstanceMethods

  attr_accessor :name, :artists, :songs

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    new(name).tap{|k| k.save}
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end

  def songs
    @songs
  end
end
