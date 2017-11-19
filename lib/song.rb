class Song
  extend Memorable::ClassMethods
  include Memorable::InstanceMethods
  attr_accessor :name
  attr_reader :artist

  @@all=[]

  def initialize(name, artist="")
    @name=name
    #@artist=artist
    @artist=artist
  end

  def self.all
    @@all
  end

  def self.create(name, artist="")
    self.new(name,artist).save
    self
  end

  def artist=(artist)
    @artist=artist
    artist.add_song(self)
  end

end
