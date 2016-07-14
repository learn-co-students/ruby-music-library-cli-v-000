class Song
  extend Concerns::Findable
  extend Concerns::Persistable::ClassMethods
  include Concerns::Persistable::InstanceMethods
  attr_accessor :name, :genre
  attr_reader :songs, :artist
  @@all = []

  def initialize(name, artist = nil)
    @name = name
    @songs = []
    #self.artist = artist if artist
  end

  def self.all
    @@all
  end

  def self.create(name)
    new(name).tap{|s| s.save}
  end

  def artist=(artist)
    self.artist = artist
    artist.add_song(self)
  end

end
