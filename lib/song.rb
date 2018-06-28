class Song
  attr_accessor :name, :genre
  attr_reader :artist

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist)
    self.genre=(genre)
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end

  def artist=(artist)
    @artist = artist
    if artist != nil
      artist.add_song(self)
    end
  end

  #def genre=(genre)
    #@genre = genre
    #genre.add_song(self)
#  end


end
