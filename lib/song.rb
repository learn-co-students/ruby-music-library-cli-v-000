class Song
  attr_accessor :name
  attr_reader :artist

  @@all = []

  def initialize(name, artist = nil)
    @name = name
    self.artist = artist unless artist == nil
  end

  def artist=(artist)
    artist.add_song(self) unless artist.songs.include?(self)
    @artist = artist
  end

  def save
    @@all << self
  end

  def self.create(name)
    Song.new(name).tap{|new_song| new_song.save}
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

end
