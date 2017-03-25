class Song
  extend Concerns::Nameable::ClassMethods
  extend Concerns::Findable::ClassMethods
  extend Concerns::Persistable::ClassMethods
  include Concerns::Persistable::InstanceMethods

  attr_accessor :name
  attr_reader :genre, :artist

  def initialize(name)
    @name = name
  end

  def genre=(genre)
    genre.songs << self unless genre.songs.include?(self)
    @genre = genre
  end

  def artist=(artist)
    artist.songs << self
    @artist = artist
  end

  def self.all
    @@all
  end

end
