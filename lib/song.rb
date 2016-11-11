class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil)
    @name = name
    if artist != nil
      @artist = artist
      @artist.add_song(self)
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = Song.new(name)
    song.save
  end

end
