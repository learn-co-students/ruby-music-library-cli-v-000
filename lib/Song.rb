
class Song
  extend Concerns::Findable
  @@all = []
  attr_accessor :name, :artist
    attr_reader :genre

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
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

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist  if artist.class == Artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre if genre.class == Genre
    genre.add_song(self) if !genre.songs.any? {|current_songs| current_songs == self}
  end

  def self.new_from_filename(file_name)
    artist = file_name.split(" - ")[0]
    song = file_name.split(" - ")[1]
    genre = file_name.split(" - ")[2].gsub(".mp3","")

    genre = Genre.find_or_create_by_name(genre)
    artist = Artist.find_or_create_by_name(artist)
    self.new(song,artist,genre)

  end

  def self.create_from_filename(file_name)
    artist = file_name.split(" - ")[0]
    song = file_name.split(" - ")[1]
    genre = file_name.split(" - ")[2].gsub(".mp3","")

    genre = Genre.find_or_create_by_name(genre)
    artist = Artist.find_or_create_by_name(artist)
    song = Song.find_or_create_by_name(song)
    song.artist = artist
    song.genre = genre
    genre.songs << song 
    #artist.songs << self
    song
  end

end
