class Song
  attr_accessor :name, :artist, :genre
  # attr_reader :artist, :genre 

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    # @artist = artist 
    # artist.add_song(self) if artist != nil
    # genre.add_song(self) if genre != nil
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def save
    @@all << self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) # unless artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    # genre.add_song(self) unless genre.songs.include?(self)
    genre.songs << self unless genre.songs.include?(self)
  end

  # def artist_name=(name)
  #   self.artist = Artist.find_or_create_by_name(name)
  #   artist.add_song(self)
  # end

  # def genre_type=(name)
  #   self.genre = Genre.find_or_create_by_name(name)
  #   genre.add_song(self)
  # end

  def self.all
    @@all
  end

  # def self.create(name)
  #   song = self.new(name)
  #   song.save
  #   song
  # end

  def self.create(name, artist = nil, genre = nil)
    new(name, artist, genre).tap{|s| s.save}
  end

  def self.find_by_name(name)
    self.all.detect { |s| s.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename)
    # artist, song, genre = filename.split(" - ")
    # new_song = self.new(song)
    # new_song.artist_name = artist
    # new_song.genre_type = genre.gsub(/\.mp3/, "")

    # new_song

    parts = filename.split(" - ")
    artist_name, song_name, genre_name = parts.first, parts[1], parts[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    # artist, song, genre = filename.split(" - ")
    # new_song = self.create(song)
    # new_song.artist_name = artist
    # new_song.genre_type = genre.gsub(/\.mp3/, "")

    # new_song

    parts = filename.split(" - ")
    artist_name, song_name, genre_name = parts.first, parts[1], parts[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.create(song_name, artist, genre)
  end

  def self.destroy_all
    @@all.clear
  end
end

