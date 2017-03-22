class Song

# attributes, variables, modules
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

# initialize
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
  end

# class methods
  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name, artist = nil, genre = nil)
    song = Song.new(name, artist, genre)
    song.save
    song
  end

  def self.new_from_filename(filename)
    song_info = filename.split(' - ')
    song_artist = Artist.find_or_create_by_name(song_info[0])
    song_name = song_info[1]
    song_genre = Genre.find_or_create_by_name(song_info[2].gsub(".mp3", ""))

    self.new(song_name, song_artist, song_genre)
  end

  def self.create_from_filename(filename)
    song_info = filename.split(' - ')
    song_artist = Artist.find_or_create_by_name(song_info[0])
    song_name = song_info[1]
    song_genre = Genre.find_or_create_by_name(song_info[2].gsub(".mp3", ""))

    self.create(song_name, song_artist, song_genre)
  end

# instance methods
  def save
    @@all << self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end
end
