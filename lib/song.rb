class Song

  extend Concerns::Findable
  extend Concerns::ClassMethods

  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
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
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = Song.new(name)
    self.all << song
    song
  end

  def self.new_from_filename(filename)
    a_name, s_name, g_name = filename.split(" - ")
    g_name = g_name.gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(a_name)
    genre = Genre.find_or_create_by_name(g_name)
    new_s = self.new(s_name, artist, genre)
  end

  def self.create_from_filename(filename)
    a_name, s_name, g_name = filename.split(" - ")
    g_name = g_name.gsub(".mp3", "")
    new_s = self.find_or_create_by_name(s_name)
    new_s.artist = Artist.find_or_create_by_name(a_name)
    new_s.genre = Genre.find_or_create_by_name(g_name)
    new_s
  end

  def print
    "#{self.artist.name} - #{self.name} - #{self.genre.name}"
  end

  def self.sort_by_artists_name
    self.all.sort do |song_a, song_b|
      song_a.artist.name <=> song_b.artist.name
    end
  end

end
