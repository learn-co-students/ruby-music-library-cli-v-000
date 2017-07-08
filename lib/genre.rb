class Genre

  extend Concerns::Findable
  extend Concerns::Persistable::ClassMethods
  extend Concerns::Nameable::ClassMethods
  include Concerns::Persistable::InstanceMethods

  @@all = []

  attr_accessor :name, :songs

  def initialize(name = nil)
    self.name = name
    self.songs = []
  end

  def self.all
    @@all
  end

  def add_song(song)
    # binding.pry
    song.genre = self if song.genre == nil
    self.songs << song unless self.songs.include?(song) == true
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end
end
