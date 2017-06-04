class Artist

  extend Concerns::Findable, Memorable::ClassMethods
  include Memorable::InstanceMethods
  attr_accessor :name, :genre, :songs

  @@all = []

  def self.all
    @@all
  end

  def add_song(song)
    super
    song.artist = self unless song.artist == self
  end

  def genres
    songs.collect {|song| song.genre}.uniq
  end

end
