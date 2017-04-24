class Genre

  attr_accessor :name, :songs

  extend Findable::ClassMethods
  include Findable::InstanceMethods
  @@all=[]

  def initialize(name)
    self.name=name
    self.songs=[]
  end
  def add_song(song)
    song.genre = self if !song.genre
    songs<<song if !songs.include?(song)
  end
  def artists
    songs.collect{|song| song.artist}.uniq
  end
  def self.all
    @@all
  end

end
