class Genre

  extend Concerns::Findable, Memorable::ClassMethods
  include Memorable::InstanceMethods
  attr_accessor :name, :songs

  @@all = []

  def self.all
    @@all
  end

  def add_song(song)
    super
    song.genre = self unless song.genre == self
  end

  def artists
    songs.collect {|song| song.artist}.uniq
  end

end
