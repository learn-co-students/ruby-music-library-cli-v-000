class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist = artist
    end
    if genre != nil
      self.genre = genre
    end
  end

  def artist=(artist)
    unless artist.songs.include?(self)
      artist.add_song(self)
    end
    @artist = artist
  end

  def genre=(genre)
    genre.add_song(self)
    @genre = genre
  end

  def save
    @@all << self
  end

  def self.create(name)
    s = self.new(name)
    @@all << s
    s
  end

  def self.new_by_filename(filename)
    split_filename = filename.split(" - ")
    song = Song.new(split_filename[1])
    song.artist_name = split_filename[0]
    return song
  end
  #
  # def artist_name=(name)
  #   @artist = Artist.find_or_create_by_name(name)
  #   @artist.add_song(self)
  # end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

end
