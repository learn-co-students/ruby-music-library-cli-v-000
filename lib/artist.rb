class Artist

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
    song.artist = self if song.artist == nil
    self.songs << song unless self.songs.include?(song) == true
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end


end
