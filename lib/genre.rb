class Genre

  attr_accessor :name, :songs

  extend Findable::ClassMethods
  include Findable::InstanceMethods
  @@all=[]

  def initialize(name)
    self.name=name
    self.songs=[]
    self.save
  end
  def add_song(song)
    song.genre=self
    songs<<song if !songs.include?(song)
  end
  def self.all
    @@all
  end

end
