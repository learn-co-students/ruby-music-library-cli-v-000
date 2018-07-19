class Song
  attr_accessor :name
  attr_reader :artist
  @@all= []

  def initialize(name, artist=nil)
    @name = name
    @artist = artist
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end

  def save
    self.class.all << self
  end


  def artist=(artist)
    @artist = artist
    artist.add_song
  end
end
