class Song

  attr_accessor :name, :genre, :artist

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      @artist = artist
      @artist.add_song(self)
    end
    if genre != nil
      @genre = genre
      @genre.add_song(self)
    end
    if genre != nil && artist != nil
      @genre.add_genre(self)
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

  def self.create(name, artist = nil)
    song = Song.new(name, artist)
    song.save
    song
  end

  def genre=(genre)
    @genre = genre
    @genre.add_song(self)
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end


end
