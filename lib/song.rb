class Song
  attr_accessor :name, :artist
  attr_reader :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name       = name
    self.artist = artist if artist
    self.genre  = genre if genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    self.new(name).save
  end

  def save
    @@all << self
    self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
    self
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
    self
  end

  def self.find_by_name(song_name)
    self.all.detect do |song_instance|
      song_instance.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
      if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create(song_name)
    end
  end

  def self.new_from_filename(file)
    artist_name      = file.split(" - ")[0]
    song_name        = file.split(" - ")[1]
    genre_name       = file.split(" - ")[2].slice(0..-5)
    artist           = Artist.find_or_create_by_name(artist_name)
    genre            = Genre.find_or_create_by_name(genre_name)
    song             = self.new(song_name, artist, genre)
    song
  end

  def self.create_from_filename(file)
    new_from_filename(file).save
  end

end
