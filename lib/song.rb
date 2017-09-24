class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist #if not nil
    self.genre = genre if genre #if not nil
  end

  def self.all
    @@all
  end

  #adds the song instance to the @@all class variable
  def save
    @@all << self
  end

  #initializes a new song instance and saves the song
  def self.create(name, artist = nil, genre = nil)
    self.new(name, artist, genre).tap{|new_song| new_song.save}
  end

  #resets the @@all class variable to an empty array
  def self.destroy_all
    @@all.clear
  end

  #adds the song to the artist's songs
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  #addss the song to the genre's songs
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.find_by_name(song_name)
    self.all.detect do |song|
      song.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create(song_name)
  end

  #initializes a song based on filename delimiters
  def self.new_from_filename(filename)
    sections = filename.split(" - ")
    artist_name, song_name, genre_name = sections.first, sections[1], sections[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    sections = filename.split(" - ")
    artist_name, song_name, genre_name = sections.first, sections[1], sections[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.create(song_name, artist,  genre)
  end

  def to_s
    "#{self.artist.name} - #{self.name} - #{self.genre.name}"
  end
end
