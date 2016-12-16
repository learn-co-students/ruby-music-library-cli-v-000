class Song
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
    # @songs = []
  end

  def songs
    @songs
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) 
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create(song, artist=nil, genre=nil)
    song = Song.new(song, artist, genre)
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end

  def self.new_from_filename(filename)
    # creates a song based on a filename
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1]
    genre_name = parts[2].gsub!(".mp3", "")
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    # creates a song based on a filename and saves it to @@all
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1]
    genre_name = parts[2].gsub!(".mp3", "")
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.create(song_name, artist, genre)
  end

  def to_s
    "#{self.artist.name} - #{self.name} - #{self.genre.name}"
  end

end


