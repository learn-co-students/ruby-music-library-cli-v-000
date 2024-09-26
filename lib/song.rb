class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
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
    self
  end

  def self.create(name)
    new(name).tap { |a| a.save }
  end

  def artist=(artist)
    @artist = artist
	  artist.add_song(self) unless artist.songs.include?(self)
	end

  def genre=(genre)
    @genre = genre
	  genre.songs << self unless genre.songs.include?(self)
	end

  def self.find_by_name(name)
    self.all.detect { |a| a.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename)
    artist_name = filename.split(" - ")[0]
    song_name = filename.split(" - ")[1]
    genre_name = filename.split(" - ")[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).tap { |a| a.save }
  end
end
