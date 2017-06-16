class Song
  attr_accessor :name
  @@all = []
  def initialize(name)
    @name = name
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(song_title)
    song = Song.new(song_title)
    @@all << song
    song
  end
end
