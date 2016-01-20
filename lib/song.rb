class Song
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist # why "self.artist as opposed to @artist or simply, artist"
    self.genre = genre if genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.new_from_filename(song_file)
    artist, name, genre = song_file.gsub(".mp3", "").split(" - ")
    song = Song.new(name)
    song.artist = Artist.find_or_create_by_name(artist)
    song.genre = Genre.find_or_create_by_name(genre)
    song
  end

  def self.create_from_filename(song_file)
    artist, name, genre = song_file.gsub(".mp3", "").split(" - ")
    song = Song.create(name)
    song.artist = Artist.find_or_create_by_name(artist)
    song.genre = Genre.find_or_create_by_name(genre)
    song
  end


end