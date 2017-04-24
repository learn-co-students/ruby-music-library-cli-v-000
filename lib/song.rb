class Song

  attr_accessor :name, :genre
  attr_reader :artist
  extend Findable::ClassMethods
  include Findable::InstanceMethods
  @@all=[]
  def initialize(name, artist=nil, genre=nil)
    self.name=name
    self.artist=artist if artist
    self.genre=genre if genre
    self.save
  end
  def artist= (artist)
    @artist=artist
    artist.add_song(self)
  end
  def self.all
    @@all
  end

end
