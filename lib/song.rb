class Song
  attr_accessor :name, :artist, :genre
  @@all = []
  def initialize(name,artist=nil,genre=nil)
    @name = name
    if artist
      self.artist = artist
    end
    if genre
      self.genre = genre
    end
  end
  def self.new_from_filename(filename)
    info = filename.split(" - ")
    song_name = info[1]
    artist_name = info.first
    genre_name = info.last.split(".").first
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    song = Song.new(song_name,artist,genre)
    song
  end
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end
  def self.find_or_create_by_name(name)
    a = self.find_by_name(name)
    return a ? a : self.create(name)
  end
  def self.find_by_name(name)
    self.all.detect{|s|
      s.name == name
    }
  end
  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end
  def genre=(genre)
    @genre = genre
    @genre.add_song(self)
  end
  def save
    @@all << self
  end
  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end
  def self.destroy_all
    @@all.clear
  end
  def self.all
    @@all
  end
end
