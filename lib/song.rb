class Song
  extend Concerns::Findable
  attr_accessor :name
  @@all = []
  def initialize(name, artist = "", genre = "")
    self.name = name
    self.artist = artist
    self.genre = genre
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
  def artist
    @artist
  end
  def artist=(artist)
    @artist = artist
    artist.add_song(self) if artist != ""
  end
  def genre
    @genre
  end
  def genre=(genre)
    @genre = genre
    genre.songs << self if genre != "" && !genre.songs.include?(self)
  end
  def self.new_from_filename(filename)
    file_artist = filename.split(" - ")[0]
    file_song_name = filename.split(" - ")[1]
    file_genre_mp3 = filename.split(" - ")[2]
    file_genre = file_genre_mp3.split(".").first
    song = Song.new(file_song_name)
    song.artist = Artist.find_or_create_by_name(file_artist)
    song.genre = Genre.find_or_create_by_name(file_genre)
    song
  end
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end
end