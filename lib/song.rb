class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
    # OR instead of creating add_song method in genre
    # genre.songs << self unless genre.songs.include?(self)
  end

  def self.find_by_name(name)
    self.all.find { |s| s.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.create_from_filename(file)
    new_song = self.new_from_filename(file)
    new_song.save

    # OR one line code
    # new_from_filename(filename).tap{ |s| s.save }
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
    song = self.new(name)
    song.save
    song

    # OR
    # new(name).tap { |s| s.save }
  end

  def self.new_from_filename(filename)
    parsed = filename.split(" - ")
    song = parsed[1]
    artist_name = parsed[0]
    genre = parsed[2].gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre)
    new_song = self.new(song, artist, genre)

    # OR
    # parts = filename.split(" - ")
    # artist_name, song_name, genre_name = parts[0], parts[1], parts[2].gsub(".mp3", "")
    #
    # artist = Artist.find_or_create_by_name(artist_name)
    # genre = Genre.find_or_create_by_name(genre_name)

    # new(song_name, artist, genre)
  end

end
