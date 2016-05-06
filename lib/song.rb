class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    @artist = artist 
    artist.add_song(self) if artist != nil
    genre.add_song(self) if genre != nil
  end

  def save
    self.class.all << self
  end

  def artist=(artist) # belongs_to artist interface
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
  end

  def genre=(genre) # belongs_to artist interface
    @genre = genre
    genre.add_song(self) unless genre.songs.include?(self)
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end

  def genre_type=(name)
    self.genre = Genre.find_or_create_by_name(name)
    genre.add_song(self)
  end

  def self.all
    @@all
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.detect { |s| s.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename)
    artist, song, genre = filename.split(" - ")
    new_song = self.new(song)
    new_song.artist_name = artist
    new_song.genre_type = genre.gsub(/\.mp3/, "")

    new_song
  end

  def self.create_from_filename(filename)
    artist, song, genre = filename.split(" - ")
    new_song = self.create(song)
    new_song.artist_name = artist
    new_song.genre_type = genre.gsub(/\.mp3/, "")

    new_song
  end

  def self.destroy_all
    self.all.clear
  end
end

