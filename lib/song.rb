class Song
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
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
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    self.artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    self.genre.add_song(self)
  end

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by_name(artist_name)
  end

  def genre_name=(genre_name)
    self.genre = Genre.find_or_create_by_name(genre_name)
  end

  def self.new_from_filename(filename)
    artistname = filename.split(" - ")[0]
    songname = filename.split(" - ")[1]
    genrename = filename.split(" - ")[2].gsub(".mp3", "")
    
    song = self.new(songname)
    song.artist_name = artistname
    song.genre_name = genrename

    song
  end

  def self.create_from_filename(filename)
      song = new_from_filename(filename)
      song.save
  end

end
