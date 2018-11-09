class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist    # = artist.add_song(self)
    self.genre = genre
    #genre.songs << self unless genre.songs.include?(self)
    @@all << self
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
    song
  end

  # def artist=(artist)
  #   @artist = artist
  #   artist.add_song(self)
  # end

  # def genre=(genre)
  #   @genre = genre
  #   genre.songs << self unless genre.songs.include?(self) #self.name fails also
  # end

end
