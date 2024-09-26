class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def genre= (genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.new_from_filename(file_name)
    info  = file_name.split(" - ")
    artist_name = info[0]
    song_name = info[1]
    genre_name = info[2].chomp(".mp3")
    song = Song.new(song_name)
    song.artist = Artist.find_or_create_by_name(artist_name)
    song.genre = Genre.find_or_create_by_name(genre_name)
    song
  end

  def self.create_from_filename(string)
    song = Song.new_from_filename(string)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def self.all
    @@all
  end

  def save
    Song.all << self
  end

  def self.destroy_all
    self.all.clear
  end


end
