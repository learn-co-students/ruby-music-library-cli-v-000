class Song
attr_accessor :name, :genre
attr_reader :artist
@@all = []

  # Constructors

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if genre
      self.genre=(genre)
    end
    if artist
      self.artist=(artist)
    end
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

# Class Methods

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end

  #Instance Methods

  def save
    @@all << self
  end

end
